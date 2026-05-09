; DESCRIPTION: Sets a single blue pixel at (299, 20).
; PLAN: r0=299(x), r1=20(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 299
LDI r1, 20
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
