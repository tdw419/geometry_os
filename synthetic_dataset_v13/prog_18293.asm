; DESCRIPTION: Places a yellow dot at position (58, 156).
; PLAN: r0=58(x), r1=156(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 58
LDI r1, 156
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
