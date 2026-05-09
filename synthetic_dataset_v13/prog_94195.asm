; DESCRIPTION: Draws a green rectangle at (427, 122) with width 68 and height 117.
; PLAN: r0=427(x), r1=122(y), r2=68(width), r3=117(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 122
LDI r2, 68
LDI r3, 117
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
