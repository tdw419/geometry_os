; DESCRIPTION: Draws a orange rectangle at (396, 97) with width 69 and height 96.
; PLAN: r0=396(x), r1=97(y), r2=69(width), r3=96(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 97
LDI r2, 69
LDI r3, 96
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
