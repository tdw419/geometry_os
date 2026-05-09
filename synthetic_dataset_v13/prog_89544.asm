; DESCRIPTION: Places a black dot at position (69, 66).
; PLAN: r0=69(x), r1=66(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 69
LDI r1, 66
LDI r2, 0x000000
PSET r0, r1, r2
HALT
