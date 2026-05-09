; DESCRIPTION: Places a black dot at position (381, 52).
; PLAN: r0=381(x), r1=52(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 381
LDI r1, 52
LDI r2, 0x000000
PSET r0, r1, r2
HALT
