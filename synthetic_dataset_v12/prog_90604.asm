; DESCRIPTION: Draws a blue circle centered at (54, 149) with radius 40.
; PLAN: r0=54(x), r1=149(y), r2=40(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 54
LDI r1, 149
LDI r2, 40
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
