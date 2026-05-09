; DESCRIPTION: Places a yellow dot at position (58, 36).
; PLAN: r0=58(x), r1=36(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 58
LDI r1, 36
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
