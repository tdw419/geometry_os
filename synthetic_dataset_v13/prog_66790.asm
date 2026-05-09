; DESCRIPTION: Places a black dot at position (109, 130).
; PLAN: r0=109(x), r1=130(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 109
LDI r1, 130
LDI r2, 0x000000
PSET r0, r1, r2
HALT
