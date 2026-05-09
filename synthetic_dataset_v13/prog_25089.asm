; DESCRIPTION: Places a black dot at position (31, 237).
; PLAN: r0=31(x), r1=237(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 31
LDI r1, 237
LDI r2, 0x000000
PSET r0, r1, r2
HALT
