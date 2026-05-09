; DESCRIPTION: Draws a orange rectangle at (318, 63) with width 58 and height 98.
; PLAN: r0=318(x), r1=63(y), r2=58(width), r3=98(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 63
LDI r2, 58
LDI r3, 98
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
