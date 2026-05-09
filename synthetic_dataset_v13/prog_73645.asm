; DESCRIPTION: Draws a blue circle centered at (476, 151) with radius 10.
; PLAN: r0=476(x), r1=151(y), r2=10(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 476
LDI r1, 151
LDI r2, 10
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
