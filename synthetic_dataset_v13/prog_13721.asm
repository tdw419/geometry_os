; DESCRIPTION: Sets a single yellow pixel at (390, 186).
; PLAN: r0=390(x), r1=186(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 390
LDI r1, 186
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
