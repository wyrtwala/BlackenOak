# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt notify
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/wyrtwala/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
alias la='exa -ahl'

# perform parameter expansion/command substitution in prompt
setopt PROMPT_SUBST

vim_ins_mode="->"
vim_cmd_mode="::"
vim_mode=$vim_ins_mode

function zle-keymap-select {
  vim_mode="${${KEYMAP/vicmd/${vim_cmd_mode}}/(main|viins)/${vim_ins_mode}}"
  zle reset-prompt
}
zle -N zle-keymap-select

function zle-line-finish {
  vim_mode=$vim_ins_mode
}
zle -N zle-line-finish

#ZSH-PROMPT
PROMPT='%F{082}%n%f@%F{058}%M%f%F{094}:%l%f %F{088}[%?]%f %F{022}>>%f %F{154}%/%f
%B%F{022}${vim_mode}%f%b'
