; DESCRIPTION: Draws a green circle centered at (244, 136) with radius 25.
; PLAN: r0=244(x), r1=136(y), r2=25(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 244
LDI r1, 136
LDI r2, 25
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
