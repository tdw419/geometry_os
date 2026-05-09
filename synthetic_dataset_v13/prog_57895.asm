; DESCRIPTION: Places a black dot at position (304, 34).
; PLAN: r0=304(x), r1=34(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 304
LDI r1, 34
LDI r2, 0x000000
PSET r0, r1, r2
HALT
