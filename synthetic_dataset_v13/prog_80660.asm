; DESCRIPTION: Draws a blue circle centered at (455, 70) with radius 34.
; PLAN: r0=455(x), r1=70(y), r2=34(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 455
LDI r1, 70
LDI r2, 34
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
