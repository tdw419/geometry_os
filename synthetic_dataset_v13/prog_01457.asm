; DESCRIPTION: Draws a orange rectangle at (54, 150) with width 97 and height 63.
; PLAN: r0=54(x), r1=150(y), r2=97(width), r3=63(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 150
LDI r2, 97
LDI r3, 63
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
