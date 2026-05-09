; DESCRIPTION: Places a yellow dot at position (211, 58).
; PLAN: r0=211(x), r1=58(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 211
LDI r1, 58
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
