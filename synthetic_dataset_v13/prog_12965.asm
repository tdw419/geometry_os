; DESCRIPTION: Places a black dot at position (203, 78).
; PLAN: r0=203(x), r1=78(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 203
LDI r1, 78
LDI r2, 0x000000
PSET r0, r1, r2
HALT
