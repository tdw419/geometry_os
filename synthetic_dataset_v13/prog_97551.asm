; DESCRIPTION: Sets a single blue pixel at (490, 45).
; PLAN: r0=490(x), r1=45(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 490
LDI r1, 45
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
