; DESCRIPTION: Draws a white rectangle at (232, 158) with width 11 and height 38.
; PLAN: r0=232(x), r1=158(y), r2=11(width), r3=38(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 158
LDI r2, 11
LDI r3, 38
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
