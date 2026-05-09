; DESCRIPTION: Places a black dot at position (78, 234).
; PLAN: r0=78(x), r1=234(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 78
LDI r1, 234
LDI r2, 0x000000
PSET r0, r1, r2
HALT
