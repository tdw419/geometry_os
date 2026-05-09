; DESCRIPTION: Sets a single green pixel at (351, 198).
; PLAN: r0=351(x), r1=198(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 351
LDI r1, 198
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
