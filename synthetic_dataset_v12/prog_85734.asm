; DESCRIPTION: Places a black dot at position (375, 34).
; PLAN: r0=375(x), r1=34(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 375
LDI r1, 34
LDI r2, 0x000000
PSET r0, r1, r2
HALT
