; DESCRIPTION: Places a black dot at position (79, 121).
; PLAN: r0=79(x), r1=121(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 79
LDI r1, 121
LDI r2, 0x000000
PSET r0, r1, r2
HALT
