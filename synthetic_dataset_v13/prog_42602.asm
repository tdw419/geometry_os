; DESCRIPTION: Places a blue circle of radius 62 at center (175, 130).
; PLAN: r0=175(x), r1=130(y), r2=62(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 175
LDI r1, 130
LDI r2, 62
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
