; DESCRIPTION: Sets a single green pixel at (306, 30).
; PLAN: r0=306(x), r1=30(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 306
LDI r1, 30
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
