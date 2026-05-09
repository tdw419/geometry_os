; DESCRIPTION: Draws a purple rectangle at (270, 130) with width 79 and height 70.
; PLAN: r0=270(x), r1=130(y), r2=79(width), r3=70(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 130
LDI r2, 79
LDI r3, 70
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
