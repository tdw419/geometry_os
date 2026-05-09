; DESCRIPTION: Draws a black rectangle at (344, 158) with width 76 and height 88.
; PLAN: r0=344(x), r1=158(y), r2=76(width), r3=88(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 158
LDI r2, 76
LDI r3, 88
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
