; DESCRIPTION: Draws a green circle centered at (385, 144) with radius 62.
; PLAN: r0=385(x), r1=144(y), r2=62(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 385
LDI r1, 144
LDI r2, 62
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
