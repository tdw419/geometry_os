; DESCRIPTION: Draws a orange rectangle at (306, 122) with width 84 and height 69.
; PLAN: r0=306(x), r1=122(y), r2=84(width), r3=69(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 122
LDI r2, 84
LDI r3, 69
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
