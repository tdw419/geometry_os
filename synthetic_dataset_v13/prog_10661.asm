; DESCRIPTION: Sets a single green pixel at (136, 30).
; PLAN: r0=136(x), r1=30(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 136
LDI r1, 30
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
