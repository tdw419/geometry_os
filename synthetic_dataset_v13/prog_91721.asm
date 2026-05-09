; DESCRIPTION: Sets a single green pixel at (99, 130).
; PLAN: r0=99(x), r1=130(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 99
LDI r1, 130
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
