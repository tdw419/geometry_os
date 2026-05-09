; DESCRIPTION: Places a black dot at position (249, 0).
; PLAN: r0=249(x), r1=0(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 249
LDI r1, 0
LDI r2, 0x000000
PSET r0, r1, r2
HALT
