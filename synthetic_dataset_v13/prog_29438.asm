; DESCRIPTION: Sets a single blue pixel at (217, 140).
; PLAN: r0=217(x), r1=140(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 217
LDI r1, 140
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
