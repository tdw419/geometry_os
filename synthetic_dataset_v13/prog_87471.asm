; DESCRIPTION: Sets a single green pixel at (353, 40).
; PLAN: r0=353(x), r1=40(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 353
LDI r1, 40
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
