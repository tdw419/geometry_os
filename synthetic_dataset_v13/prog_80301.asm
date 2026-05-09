; DESCRIPTION: Places a black dot at position (431, 191).
; PLAN: r0=431(x), r1=191(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 431
LDI r1, 191
LDI r2, 0x000000
PSET r0, r1, r2
HALT
