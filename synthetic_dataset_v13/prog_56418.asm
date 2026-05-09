; DESCRIPTION: Draws a green rectangle at (62, 55) with width 70 and height 101.
; PLAN: r0=62(x), r1=55(y), r2=70(width), r3=101(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 55
LDI r2, 70
LDI r3, 101
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
