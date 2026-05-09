; DESCRIPTION: Places a black dot at position (123, 102).
; PLAN: r0=123(x), r1=102(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 123
LDI r1, 102
LDI r2, 0x000000
PSET r0, r1, r2
HALT
