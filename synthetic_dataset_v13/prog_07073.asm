; DESCRIPTION: Draws a orange rectangle at (102, 158) with width 80 and height 29.
; PLAN: r0=102(x), r1=158(y), r2=80(width), r3=29(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 158
LDI r2, 80
LDI r3, 29
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
