; DESCRIPTION: Draws a orange rectangle at (191, 101) with width 36 and height 26.
; PLAN: r0=191(x), r1=101(y), r2=36(width), r3=26(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 101
LDI r2, 36
LDI r3, 26
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
