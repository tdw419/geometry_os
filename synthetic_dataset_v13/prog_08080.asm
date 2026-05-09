; DESCRIPTION: Draws a blue circle centered at (327, 83) with radius 70.
; PLAN: r0=327(x), r1=83(y), r2=70(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 327
LDI r1, 83
LDI r2, 70
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
