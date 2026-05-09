; DESCRIPTION: Draws a purple rectangle at (232, 130) with width 47 and height 32.
; PLAN: r0=232(x), r1=130(y), r2=47(width), r3=32(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 130
LDI r2, 47
LDI r3, 32
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
