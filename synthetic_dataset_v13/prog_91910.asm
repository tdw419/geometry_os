; DESCRIPTION: Places a black dot at position (37, 79).
; PLAN: r0=37(x), r1=79(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 37
LDI r1, 79
LDI r2, 0x000000
PSET r0, r1, r2
HALT
