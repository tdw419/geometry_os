; DESCRIPTION: Sets a single blue pixel at (447, 12).
; PLAN: r0=447(x), r1=12(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 447
LDI r1, 12
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
