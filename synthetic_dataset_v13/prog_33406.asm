; DESCRIPTION: Draws a orange rectangle at (91, 105) with width 67 and height 15.
; PLAN: r0=91(x), r1=105(y), r2=67(width), r3=15(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 105
LDI r2, 67
LDI r3, 15
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
