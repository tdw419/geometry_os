; DESCRIPTION: Draws a green circle centered at (344, 69) with radius 54.
; PLAN: r0=344(x), r1=69(y), r2=54(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 344
LDI r1, 69
LDI r2, 54
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
