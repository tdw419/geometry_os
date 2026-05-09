; DESCRIPTION: Sets a single blue pixel at (447, 15).
; PLAN: r0=447(x), r1=15(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 447
LDI r1, 15
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
