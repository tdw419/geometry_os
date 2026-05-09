; DESCRIPTION: Places a black dot at position (236, 1).
; PLAN: r0=236(x), r1=1(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 236
LDI r1, 1
LDI r2, 0x000000
PSET r0, r1, r2
HALT
