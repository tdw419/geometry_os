; DESCRIPTION: Draws a orange rectangle at (125, 158) with width 102 and height 83.
; PLAN: r0=125(x), r1=158(y), r2=102(width), r3=83(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 158
LDI r2, 102
LDI r3, 83
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
