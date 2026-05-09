; DESCRIPTION: Places a black dot at position (153, 97).
; PLAN: r0=153(x), r1=97(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 153
LDI r1, 97
LDI r2, 0x000000
PSET r0, r1, r2
HALT
