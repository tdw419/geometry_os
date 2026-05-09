; DESCRIPTION: Places a black dot at position (359, 73).
; PLAN: r0=359(x), r1=73(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 359
LDI r1, 73
LDI r2, 0x000000
PSET r0, r1, r2
HALT
