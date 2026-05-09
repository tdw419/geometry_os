; DESCRIPTION: Sets a single blue pixel at (338, 32).
; PLAN: r0=338(x), r1=32(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 338
LDI r1, 32
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
