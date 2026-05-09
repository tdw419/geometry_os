; DESCRIPTION: Sets a single blue pixel at (332, 69).
; PLAN: r0=332(x), r1=69(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 332
LDI r1, 69
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
