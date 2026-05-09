; DESCRIPTION: Draws a orange rectangle at (318, 181) with width 16 and height 12.
; PLAN: r0=318(x), r1=181(y), r2=16(width), r3=12(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 181
LDI r2, 16
LDI r3, 12
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
