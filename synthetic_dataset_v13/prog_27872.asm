; DESCRIPTION: Draws a orange rectangle at (313, 155) with width 55 and height 62.
; PLAN: r0=313(x), r1=155(y), r2=55(width), r3=62(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 155
LDI r2, 55
LDI r3, 62
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
