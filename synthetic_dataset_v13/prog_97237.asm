; DESCRIPTION: Sets a single green pixel at (104, 142).
; PLAN: r0=104(x), r1=142(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 104
LDI r1, 142
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
