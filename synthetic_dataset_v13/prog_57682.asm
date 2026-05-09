; DESCRIPTION: Places a black dot at position (137, 9).
; PLAN: r0=137(x), r1=9(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 137
LDI r1, 9
LDI r2, 0x000000
PSET r0, r1, r2
HALT
