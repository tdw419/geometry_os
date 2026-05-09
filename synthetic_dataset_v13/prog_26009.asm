; DESCRIPTION: Sets a single green pixel at (442, 77).
; PLAN: r0=442(x), r1=77(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 442
LDI r1, 77
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
