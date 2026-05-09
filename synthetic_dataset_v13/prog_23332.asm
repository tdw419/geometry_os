; DESCRIPTION: Sets a single green pixel at (353, 44).
; PLAN: r0=353(x), r1=44(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 353
LDI r1, 44
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
