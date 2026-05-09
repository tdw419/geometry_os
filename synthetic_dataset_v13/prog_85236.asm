; DESCRIPTION: Sets a single blue pixel at (494, 233).
; PLAN: r0=494(x), r1=233(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 494
LDI r1, 233
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
