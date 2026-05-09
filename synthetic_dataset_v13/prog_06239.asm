; DESCRIPTION: Places a yellow circle of radius 43 at center (155, 104).
; PLAN: r0=155(x), r1=104(y), r2=43(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 155
LDI r1, 104
LDI r2, 43
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
