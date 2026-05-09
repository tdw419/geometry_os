; DESCRIPTION: Sets a single magenta pixel at (84, 250).
; PLAN: r0=84(x), r1=250(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 84
LDI r1, 250
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
