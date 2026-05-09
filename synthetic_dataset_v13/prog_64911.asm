; DESCRIPTION: Draws a blue circle centered at (372, 101) with radius 59.
; PLAN: r0=372(x), r1=101(y), r2=59(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 372
LDI r1, 101
LDI r2, 59
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
