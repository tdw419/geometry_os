; DESCRIPTION: Draws a purple rectangle at (15, 5) with width 67 and height 119.
; PLAN: r0=15(x), r1=5(y), r2=67(width), r3=119(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 5
LDI r2, 67
LDI r3, 119
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
