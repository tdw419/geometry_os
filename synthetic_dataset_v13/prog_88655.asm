; DESCRIPTION: Places a black dot at position (85, 13).
; PLAN: r0=85(x), r1=13(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 85
LDI r1, 13
LDI r2, 0x000000
PSET r0, r1, r2
HALT
