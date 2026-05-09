; DESCRIPTION: Sets a single magenta pixel at (119, 129).
; PLAN: r0=119(x), r1=129(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 119
LDI r1, 129
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
