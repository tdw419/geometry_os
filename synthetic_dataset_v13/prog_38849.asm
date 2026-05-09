; DESCRIPTION: Places a black dot at position (432, 184).
; PLAN: r0=432(x), r1=184(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 432
LDI r1, 184
LDI r2, 0x000000
PSET r0, r1, r2
HALT
