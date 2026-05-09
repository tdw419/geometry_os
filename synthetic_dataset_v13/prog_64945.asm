; DESCRIPTION: Sets a single yellow pixel at (390, 104).
; PLAN: r0=390(x), r1=104(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 390
LDI r1, 104
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
