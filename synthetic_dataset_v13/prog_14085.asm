; DESCRIPTION: Sets a single green pixel at (83, 73).
; PLAN: r0=83(x), r1=73(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 83
LDI r1, 73
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
