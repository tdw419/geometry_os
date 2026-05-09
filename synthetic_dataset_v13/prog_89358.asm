; DESCRIPTION: Places a black dot at position (324, 21).
; PLAN: r0=324(x), r1=21(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 324
LDI r1, 21
LDI r2, 0x000000
PSET r0, r1, r2
HALT
