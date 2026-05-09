; DESCRIPTION: Sets a single blue pixel at (323, 97).
; PLAN: r0=323(x), r1=97(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 323
LDI r1, 97
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
