; DESCRIPTION: Places a yellow circle of radius 46 at center (156, 106).
; PLAN: r0=156(x), r1=106(y), r2=46(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 156
LDI r1, 106
LDI r2, 46
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
