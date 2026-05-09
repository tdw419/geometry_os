; DESCRIPTION: Places a blue circle of radius 52 at center (59, 88).
; PLAN: r0=59(x), r1=88(y), r2=52(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 59
LDI r1, 88
LDI r2, 52
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
