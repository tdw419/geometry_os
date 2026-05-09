; DESCRIPTION: Places a yellow dot at position (138, 67).
; PLAN: r0=138(x), r1=67(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 138
LDI r1, 67
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
