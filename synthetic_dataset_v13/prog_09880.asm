; DESCRIPTION: Sets a single black pixel at (155, 97).
; PLAN: r0=155(x), r1=97(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 155
LDI r1, 97
LDI r2, 0x000000
PSET r0, r1, r2
HALT
