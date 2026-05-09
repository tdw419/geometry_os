; DESCRIPTION: Draws a blue circle centered at (249, 175) with radius 55.
; PLAN: r0=249(x), r1=175(y), r2=55(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 249
LDI r1, 175
LDI r2, 55
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
