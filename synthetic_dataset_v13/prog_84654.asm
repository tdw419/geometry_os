; DESCRIPTION: Places a black dot at position (272, 49).
; PLAN: r0=272(x), r1=49(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 272
LDI r1, 49
LDI r2, 0x000000
PSET r0, r1, r2
HALT
