; DESCRIPTION: Sets a single green pixel at (181, 18).
; PLAN: r0=181(x), r1=18(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 181
LDI r1, 18
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
