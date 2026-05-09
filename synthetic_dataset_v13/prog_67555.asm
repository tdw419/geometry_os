; DESCRIPTION: Places a yellow dot at position (188, 155).
; PLAN: r0=188(x), r1=155(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 188
LDI r1, 155
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
