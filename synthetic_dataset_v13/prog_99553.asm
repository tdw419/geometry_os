; DESCRIPTION: Draws a orange rectangle at (101, 91) with width 96 and height 78.
; PLAN: r0=101(x), r1=91(y), r2=96(width), r3=78(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 91
LDI r2, 96
LDI r3, 78
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
