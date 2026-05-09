; DESCRIPTION: Sets a single green pixel at (363, 129).
; PLAN: r0=363(x), r1=129(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 363
LDI r1, 129
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
