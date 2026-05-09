; DESCRIPTION: Sets a single green pixel at (24, 47).
; PLAN: r0=24(x), r1=47(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 24
LDI r1, 47
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
