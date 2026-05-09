; DESCRIPTION: Places a yellow dot at position (101, 71).
; PLAN: r0=101(x), r1=71(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 101
LDI r1, 71
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
