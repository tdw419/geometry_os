; DESCRIPTION: Draws a orange rectangle at (216, 15) with width 54 and height 81.
; PLAN: r0=216(x), r1=15(y), r2=54(width), r3=81(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 15
LDI r2, 54
LDI r3, 81
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
