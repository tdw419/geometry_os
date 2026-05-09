; DESCRIPTION: Draws a orange rectangle at (414, 63) with width 87 and height 97.
; PLAN: r0=414(x), r1=63(y), r2=87(width), r3=97(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 63
LDI r2, 87
LDI r3, 97
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
