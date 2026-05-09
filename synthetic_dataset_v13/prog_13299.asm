; DESCRIPTION: Draws a green rectangle at (339, 123) with width 95 and height 60.
; PLAN: r0=339(x), r1=123(y), r2=95(width), r3=60(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 123
LDI r2, 95
LDI r3, 60
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
