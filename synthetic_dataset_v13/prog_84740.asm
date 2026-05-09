; DESCRIPTION: Sets a single green pixel at (424, 15).
; PLAN: r0=424(x), r1=15(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 424
LDI r1, 15
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
