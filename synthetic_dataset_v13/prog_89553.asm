; DESCRIPTION: Draws a orange rectangle at (136, 192) with width 43 and height 54.
; PLAN: r0=136(x), r1=192(y), r2=43(width), r3=54(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 192
LDI r2, 43
LDI r3, 54
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
