; DESCRIPTION: Draws a green circle centered at (344, 155) with radius 45.
; PLAN: r0=344(x), r1=155(y), r2=45(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 344
LDI r1, 155
LDI r2, 45
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
