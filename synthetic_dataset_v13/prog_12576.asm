; DESCRIPTION: Sets a single green pixel at (20, 211).
; PLAN: r0=20(x), r1=211(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 20
LDI r1, 211
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
