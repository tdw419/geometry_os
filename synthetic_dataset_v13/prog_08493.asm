; DESCRIPTION: Places a black dot at position (17, 203).
; PLAN: r0=17(x), r1=203(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 17
LDI r1, 203
LDI r2, 0x000000
PSET r0, r1, r2
HALT
