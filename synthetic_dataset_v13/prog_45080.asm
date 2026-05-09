; DESCRIPTION: Draws a black circle centered at (416, 165) with radius 23.
; PLAN: r0=416(x), r1=165(y), r2=23(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 416
LDI r1, 165
LDI r2, 23
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
