; DESCRIPTION: Sets a single blue pixel at (323, 240).
; PLAN: r0=323(x), r1=240(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 323
LDI r1, 240
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
