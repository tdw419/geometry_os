; DESCRIPTION: Draws a orange rectangle at (28, 84) with width 49 and height 68.
; PLAN: r0=28(x), r1=84(y), r2=49(width), r3=68(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 84
LDI r2, 49
LDI r3, 68
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
