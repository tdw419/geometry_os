; DESCRIPTION: Places a yellow dot at position (496, 88).
; PLAN: r0=496(x), r1=88(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 496
LDI r1, 88
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
