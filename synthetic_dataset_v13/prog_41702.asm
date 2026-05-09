; DESCRIPTION: Draws a blue circle centered at (318, 48) with radius 29.
; PLAN: r0=318(x), r1=48(y), r2=29(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 318
LDI r1, 48
LDI r2, 29
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
