; DESCRIPTION: Sets a single cyan pixel at (478, 23).
; PLAN: r0=478(x), r1=23(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 478
LDI r1, 23
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
