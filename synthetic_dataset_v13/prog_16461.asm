; DESCRIPTION: Sets a single blue pixel at (399, 44).
; PLAN: r0=399(x), r1=44(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 399
LDI r1, 44
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
