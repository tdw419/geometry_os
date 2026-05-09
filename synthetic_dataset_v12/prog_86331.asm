; DESCRIPTION: Draws a blue rectangle at (67, 101) with width 117 and height 13.
; PLAN: r0=67(x), r1=101(y), r2=117(width), r3=13(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 101
LDI r2, 117
LDI r3, 13
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
