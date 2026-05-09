; DESCRIPTION: Draws a orange rectangle at (101, 101) with width 13 and height 22.
; PLAN: r0=101(x), r1=101(y), r2=13(width), r3=22(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 101
LDI r2, 13
LDI r3, 22
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
