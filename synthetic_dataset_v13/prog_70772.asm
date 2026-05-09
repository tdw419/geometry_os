; DESCRIPTION: Sets a single green pixel at (457, 1).
; PLAN: r0=457(x), r1=1(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 457
LDI r1, 1
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
