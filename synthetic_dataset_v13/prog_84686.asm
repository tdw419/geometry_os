; DESCRIPTION: Sets a single green pixel at (233, 66).
; PLAN: r0=233(x), r1=66(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 233
LDI r1, 66
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
