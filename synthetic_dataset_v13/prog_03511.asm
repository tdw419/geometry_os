; DESCRIPTION: Places a yellow dot at position (351, 97).
; PLAN: r0=351(x), r1=97(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 351
LDI r1, 97
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
