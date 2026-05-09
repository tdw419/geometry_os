; DESCRIPTION: Draws a orange rectangle at (29, 84) with width 117 and height 22.
; PLAN: r0=29(x), r1=84(y), r2=117(width), r3=22(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 84
LDI r2, 117
LDI r3, 22
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
