; DESCRIPTION: Places a yellow dot at position (328, 101).
; PLAN: r0=328(x), r1=101(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 328
LDI r1, 101
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
