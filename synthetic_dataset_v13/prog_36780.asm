; DESCRIPTION: Sets a single green pixel at (201, 188).
; PLAN: r0=201(x), r1=188(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 201
LDI r1, 188
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
