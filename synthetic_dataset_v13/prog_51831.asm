; DESCRIPTION: Places a black dot at position (191, 68).
; PLAN: r0=191(x), r1=68(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 191
LDI r1, 68
LDI r2, 0x000000
PSET r0, r1, r2
HALT
