; DESCRIPTION: Places a black dot at position (94, 104).
; PLAN: r0=94(x), r1=104(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 94
LDI r1, 104
LDI r2, 0x000000
PSET r0, r1, r2
HALT
