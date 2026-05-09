; DESCRIPTION: Draws a blue circle centered at (370, 104) with radius 43.
; PLAN: r0=370(x), r1=104(y), r2=43(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 370
LDI r1, 104
LDI r2, 43
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
