; DESCRIPTION: Places a yellow circle of radius 62 at center (230, 129).
; PLAN: r0=230(x), r1=129(y), r2=62(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 230
LDI r1, 129
LDI r2, 62
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
