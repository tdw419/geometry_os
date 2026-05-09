; DESCRIPTION: Sets a single green pixel at (175, 216).
; PLAN: r0=175(x), r1=216(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 175
LDI r1, 216
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
