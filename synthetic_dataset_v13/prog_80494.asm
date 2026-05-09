; DESCRIPTION: Sets a single green pixel at (0, 130).
; PLAN: r0=0(x), r1=130(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 0
LDI r1, 130
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
