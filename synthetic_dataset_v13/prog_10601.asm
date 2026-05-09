; DESCRIPTION: Draws a green circle centered at (244, 84) with radius 74.
; PLAN: r0=244(x), r1=84(y), r2=74(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 244
LDI r1, 84
LDI r2, 74
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
