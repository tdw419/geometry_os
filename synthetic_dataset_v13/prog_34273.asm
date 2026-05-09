; DESCRIPTION: Draws a purple rectangle at (412, 69) with width 78 and height 88.
; PLAN: r0=412(x), r1=69(y), r2=78(width), r3=88(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 69
LDI r2, 78
LDI r3, 88
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
