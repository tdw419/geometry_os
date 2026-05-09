; DESCRIPTION: Draws a orange rectangle at (357, 19) with width 22 and height 80.
; PLAN: r0=357(x), r1=19(y), r2=22(width), r3=80(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 19
LDI r2, 22
LDI r3, 80
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
