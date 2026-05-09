; DESCRIPTION: Draws a blue rectangle at (88, 96) with width 14 and height 97.
; PLAN: r0=88(x), r1=96(y), r2=14(width), r3=97(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 96
LDI r2, 14
LDI r3, 97
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
