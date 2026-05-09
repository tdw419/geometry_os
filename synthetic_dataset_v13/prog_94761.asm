; DESCRIPTION: Draws a orange rectangle at (212, 62) with width 48 and height 84.
; PLAN: r0=212(x), r1=62(y), r2=48(width), r3=84(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 62
LDI r2, 48
LDI r3, 84
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
