; DESCRIPTION: Draws a orange rectangle at (188, 156) with width 61 and height 10.
; PLAN: r0=188(x), r1=156(y), r2=61(width), r3=10(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 156
LDI r2, 61
LDI r3, 10
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
