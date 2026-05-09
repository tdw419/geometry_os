; DESCRIPTION: Places a black dot at position (411, 83).
; PLAN: r0=411(x), r1=83(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 411
LDI r1, 83
LDI r2, 0x000000
PSET r0, r1, r2
HALT
