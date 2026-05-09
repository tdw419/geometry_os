; DESCRIPTION: Sets a single green pixel at (407, 121).
; PLAN: r0=407(x), r1=121(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 407
LDI r1, 121
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
