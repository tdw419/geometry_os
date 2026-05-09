; DESCRIPTION: Draws a orange rectangle at (8, 122) with width 117 and height 76.
; PLAN: r0=8(x), r1=122(y), r2=117(width), r3=76(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 122
LDI r2, 117
LDI r3, 76
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
