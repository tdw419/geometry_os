; DESCRIPTION: Draws a green rectangle at (58, 19) with width 55 and height 62.
; PLAN: r0=58(x), r1=19(y), r2=55(width), r3=62(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 19
LDI r2, 55
LDI r3, 62
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
