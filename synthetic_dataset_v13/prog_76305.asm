; DESCRIPTION: Draws a white rectangle at (88, 158) with width 20 and height 72.
; PLAN: r0=88(x), r1=158(y), r2=20(width), r3=72(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 158
LDI r2, 20
LDI r3, 72
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
