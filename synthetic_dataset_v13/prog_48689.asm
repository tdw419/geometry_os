; DESCRIPTION: Draws a green rectangle at (427, 174) with width 62 and height 43.
; PLAN: r0=427(x), r1=174(y), r2=62(width), r3=43(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 174
LDI r2, 62
LDI r3, 43
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
