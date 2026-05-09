; DESCRIPTION: Places a black dot at position (84, 62).
; PLAN: r0=84(x), r1=62(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 84
LDI r1, 62
LDI r2, 0x000000
PSET r0, r1, r2
HALT
