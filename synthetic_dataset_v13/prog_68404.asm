; DESCRIPTION: Places a black dot at position (15, 85).
; PLAN: r0=15(x), r1=85(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 15
LDI r1, 85
LDI r2, 0x000000
PSET r0, r1, r2
HALT
