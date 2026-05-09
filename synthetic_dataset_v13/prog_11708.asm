; DESCRIPTION: Sets a single magenta pixel at (35, 114).
; PLAN: r0=35(x), r1=114(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 35
LDI r1, 114
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
