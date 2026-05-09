; DESCRIPTION: Draws a orange rectangle at (258, 123) with width 44 and height 112.
; PLAN: r0=258(x), r1=123(y), r2=44(width), r3=112(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 123
LDI r2, 44
LDI r3, 112
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
