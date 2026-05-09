; DESCRIPTION: Places a black dot at position (49, 118).
; PLAN: r0=49(x), r1=118(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 49
LDI r1, 118
LDI r2, 0x000000
PSET r0, r1, r2
HALT
