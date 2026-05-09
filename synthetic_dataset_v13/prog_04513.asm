; DESCRIPTION: Places a black dot at position (55, 119).
; PLAN: r0=55(x), r1=119(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 55
LDI r1, 119
LDI r2, 0x000000
PSET r0, r1, r2
HALT
