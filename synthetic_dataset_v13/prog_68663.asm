; DESCRIPTION: Sets a single magenta pixel at (453, 73).
; PLAN: r0=453(x), r1=73(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 453
LDI r1, 73
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
