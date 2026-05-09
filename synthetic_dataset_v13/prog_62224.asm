; DESCRIPTION: Sets a single green pixel at (427, 155).
; PLAN: r0=427(x), r1=155(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 427
LDI r1, 155
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
