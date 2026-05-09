; DESCRIPTION: Sets a single magenta pixel at (279, 198).
; PLAN: r0=279(x), r1=198(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 279
LDI r1, 198
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
