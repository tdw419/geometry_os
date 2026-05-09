; DESCRIPTION: Draws a blue rectangle at (344, 106) with width 50 and height 88.
; PLAN: r0=344(x), r1=106(y), r2=50(width), r3=88(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 106
LDI r2, 50
LDI r3, 88
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
