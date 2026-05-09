; DESCRIPTION: Places a green circle of radius 54 at center (421, 88).
; PLAN: r0=421(x), r1=88(y), r2=54(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 421
LDI r1, 88
LDI r2, 54
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
