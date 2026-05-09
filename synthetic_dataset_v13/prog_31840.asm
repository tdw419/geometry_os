; DESCRIPTION: Places a black dot at position (232, 77).
; PLAN: r0=232(x), r1=77(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 232
LDI r1, 77
LDI r2, 0x000000
PSET r0, r1, r2
HALT
