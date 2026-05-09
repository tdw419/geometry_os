; DESCRIPTION: Draws a green rectangle at (452, 78) with width 38 and height 55.
; PLAN: r0=452(x), r1=78(y), r2=38(width), r3=55(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 452
LDI r1, 78
LDI r2, 38
LDI r3, 55
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
