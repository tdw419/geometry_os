; DESCRIPTION: Places a black dot at position (424, 138).
; PLAN: r0=424(x), r1=138(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 424
LDI r1, 138
LDI r2, 0x000000
PSET r0, r1, r2
HALT
