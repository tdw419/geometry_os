; DESCRIPTION: Sets a single blue pixel at (316, 77).
; PLAN: r0=316(x), r1=77(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 316
LDI r1, 77
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
