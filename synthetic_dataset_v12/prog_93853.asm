; DESCRIPTION: Draws a blue rectangle at (357, 110) with width 26 and height 78.
; PLAN: r0=357(x), r1=110(y), r2=26(width), r3=78(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 110
LDI r2, 26
LDI r3, 78
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
