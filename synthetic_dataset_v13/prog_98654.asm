; DESCRIPTION: Draws a orange rectangle at (462, 155) with width 49 and height 58.
; PLAN: r0=462(x), r1=155(y), r2=49(width), r3=58(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 462
LDI r1, 155
LDI r2, 49
LDI r3, 58
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
