; DESCRIPTION: Places a yellow circle of radius 47 at center (227, 68).
; PLAN: r0=227(x), r1=68(y), r2=47(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 227
LDI r1, 68
LDI r2, 47
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
