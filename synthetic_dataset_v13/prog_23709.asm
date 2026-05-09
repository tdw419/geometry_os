; DESCRIPTION: Sets a single blue pixel at (363, 1).
; PLAN: r0=363(x), r1=1(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 363
LDI r1, 1
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
