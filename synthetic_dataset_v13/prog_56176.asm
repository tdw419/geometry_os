; DESCRIPTION: Draws a orange rectangle at (89, 139) with width 25 and height 84.
; PLAN: r0=89(x), r1=139(y), r2=25(width), r3=84(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 139
LDI r2, 25
LDI r3, 84
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
