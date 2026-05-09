; DESCRIPTION: Draws a orange rectangle at (56, 86) with width 83 and height 85.
; PLAN: r0=56(x), r1=86(y), r2=83(width), r3=85(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 86
LDI r2, 83
LDI r3, 85
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
