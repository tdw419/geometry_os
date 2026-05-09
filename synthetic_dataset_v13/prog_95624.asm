; DESCRIPTION: Draws a orange rectangle at (181, 56) with width 50 and height 115.
; PLAN: r0=181(x), r1=56(y), r2=50(width), r3=115(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 56
LDI r2, 50
LDI r3, 115
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
