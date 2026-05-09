; DESCRIPTION: Draws a orange rectangle at (84, 199) with width 72 and height 22.
; PLAN: r0=84(x), r1=199(y), r2=72(width), r3=22(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 199
LDI r2, 72
LDI r3, 22
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
