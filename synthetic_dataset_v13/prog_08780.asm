; DESCRIPTION: Draws a purple rectangle at (318, 130) with width 69 and height 66.
; PLAN: r0=318(x), r1=130(y), r2=69(width), r3=66(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 130
LDI r2, 69
LDI r3, 66
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
