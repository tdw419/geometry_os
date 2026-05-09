; DESCRIPTION: Sets a single green pixel at (395, 105).
; PLAN: r0=395(x), r1=105(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 395
LDI r1, 105
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
