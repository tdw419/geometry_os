; DESCRIPTION: Draws a orange rectangle at (115, 174) with width 62 and height 29.
; PLAN: r0=115(x), r1=174(y), r2=62(width), r3=29(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 174
LDI r2, 62
LDI r3, 29
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
