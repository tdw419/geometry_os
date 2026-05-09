; DESCRIPTION: Places a black dot at position (478, 214).
; PLAN: r0=478(x), r1=214(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 478
LDI r1, 214
LDI r2, 0x000000
PSET r0, r1, r2
HALT
