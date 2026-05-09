; DESCRIPTION: Places a black dot at position (399, 137).
; PLAN: r0=399(x), r1=137(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 399
LDI r1, 137
LDI r2, 0x000000
PSET r0, r1, r2
HALT
