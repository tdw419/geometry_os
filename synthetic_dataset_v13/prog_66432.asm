; DESCRIPTION: Draws a orange rectangle at (105, 155) with width 89 and height 39.
; PLAN: r0=105(x), r1=155(y), r2=89(width), r3=39(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 155
LDI r2, 89
LDI r3, 39
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
