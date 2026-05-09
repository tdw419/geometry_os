; DESCRIPTION: Places a black dot at position (114, 222).
; PLAN: r0=114(x), r1=222(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 114
LDI r1, 222
LDI r2, 0x000000
PSET r0, r1, r2
HALT
