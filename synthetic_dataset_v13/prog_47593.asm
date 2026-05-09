; DESCRIPTION: Sets a single green pixel at (310, 79).
; PLAN: r0=310(x), r1=79(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 310
LDI r1, 79
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
