; DESCRIPTION: Draws a black circle centered at (416, 136) with radius 47.
; PLAN: r0=416(x), r1=136(y), r2=47(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 416
LDI r1, 136
LDI r2, 47
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
