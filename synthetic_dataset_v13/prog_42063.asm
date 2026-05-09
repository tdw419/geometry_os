; DESCRIPTION: Sets a single green pixel at (19, 98).
; PLAN: r0=19(x), r1=98(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 19
LDI r1, 98
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
