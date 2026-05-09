; DESCRIPTION: Sets a single green pixel at (80, 22).
; PLAN: r0=80(x), r1=22(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 80
LDI r1, 22
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
