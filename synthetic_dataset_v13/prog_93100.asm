; DESCRIPTION: Places a blue circle of radius 13 at center (225, 88).
; PLAN: r0=225(x), r1=88(y), r2=13(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 225
LDI r1, 88
LDI r2, 13
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
