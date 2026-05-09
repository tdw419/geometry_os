; DESCRIPTION: Draws a blue circle centered at (119, 59) with radius 40.
; PLAN: r0=119(x), r1=59(y), r2=40(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 119
LDI r1, 59
LDI r2, 40
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
