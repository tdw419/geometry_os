; DESCRIPTION: Draws a purple rectangle at (326, 130) with width 100 and height 114.
; PLAN: r0=326(x), r1=130(y), r2=100(width), r3=114(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 130
LDI r2, 100
LDI r3, 114
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
