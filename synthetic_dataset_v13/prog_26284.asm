; DESCRIPTION: Draws a purple rectangle at (110, 121) with width 67 and height 119.
; PLAN: r0=110(x), r1=121(y), r2=67(width), r3=119(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 121
LDI r2, 67
LDI r3, 119
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
