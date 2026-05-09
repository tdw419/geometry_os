; DESCRIPTION: Places a yellow dot at position (163, 244).
; PLAN: r0=163(x), r1=244(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 163
LDI r1, 244
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
