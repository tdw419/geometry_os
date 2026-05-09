; DESCRIPTION: Sets a single blue pixel at (376, 218).
; PLAN: r0=376(x), r1=218(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 376
LDI r1, 218
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
