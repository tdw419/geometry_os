; DESCRIPTION: Places a black dot at position (68, 225).
; PLAN: r0=68(x), r1=225(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 68
LDI r1, 225
LDI r2, 0x000000
PSET r0, r1, r2
HALT
