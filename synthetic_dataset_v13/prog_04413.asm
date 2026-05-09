; DESCRIPTION: Places a yellow dot at position (163, 69).
; PLAN: r0=163(x), r1=69(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 163
LDI r1, 69
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
