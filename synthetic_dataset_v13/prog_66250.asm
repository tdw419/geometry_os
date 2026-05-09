; DESCRIPTION: Places a black dot at position (19, 73).
; PLAN: r0=19(x), r1=73(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 19
LDI r1, 73
LDI r2, 0x000000
PSET r0, r1, r2
HALT
