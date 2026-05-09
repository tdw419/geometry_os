; DESCRIPTION: Sets a single cyan pixel at (417, 130).
; PLAN: r0=417(x), r1=130(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 417
LDI r1, 130
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
