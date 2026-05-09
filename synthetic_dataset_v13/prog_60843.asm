; DESCRIPTION: Draws a green circle centered at (470, 155) with radius 35.
; PLAN: r0=470(x), r1=155(y), r2=35(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 470
LDI r1, 155
LDI r2, 35
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
