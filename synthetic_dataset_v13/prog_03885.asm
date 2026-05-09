; DESCRIPTION: Places a black dot at position (96, 65).
; PLAN: r0=96(x), r1=65(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 96
LDI r1, 65
LDI r2, 0x000000
PSET r0, r1, r2
HALT
