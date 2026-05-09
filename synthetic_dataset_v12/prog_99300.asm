; DESCRIPTION: Draws a yellow rectangle at (427, 9) with width 85 and height 117.
; PLAN: r0=427(x), r1=9(y), r2=85(width), r3=117(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 9
LDI r2, 85
LDI r3, 117
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
