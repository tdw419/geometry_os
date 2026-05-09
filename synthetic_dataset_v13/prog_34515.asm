; DESCRIPTION: Places a yellow dot at position (270, 129).
; PLAN: r0=270(x), r1=129(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 270
LDI r1, 129
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
