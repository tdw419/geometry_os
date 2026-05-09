; DESCRIPTION: Sets a single yellow pixel at (155, 188).
; PLAN: r0=155(x), r1=188(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 155
LDI r1, 188
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
