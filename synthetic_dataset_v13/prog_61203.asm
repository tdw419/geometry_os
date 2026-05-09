; DESCRIPTION: Places a yellow dot at position (62, 59).
; PLAN: r0=62(x), r1=59(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 62
LDI r1, 59
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
