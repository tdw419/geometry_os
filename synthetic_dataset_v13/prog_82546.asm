; DESCRIPTION: Draws a blue circle centered at (306, 175) with radius 48.
; PLAN: r0=306(x), r1=175(y), r2=48(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 306
LDI r1, 175
LDI r2, 48
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
