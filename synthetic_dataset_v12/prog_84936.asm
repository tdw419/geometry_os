; DESCRIPTION: Sets a single magenta pixel at (490, 49).
; PLAN: r0=490(x), r1=49(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 490
LDI r1, 49
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
