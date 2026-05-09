; DESCRIPTION: Sets a single green pixel at (312, 86).
; PLAN: r0=312(x), r1=86(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 312
LDI r1, 86
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
