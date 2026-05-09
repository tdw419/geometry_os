; DESCRIPTION: Draws a orange rectangle at (10, 4) with width 85 and height 43.
; PLAN: r0=10(x), r1=4(y), r2=85(width), r3=43(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 4
LDI r2, 85
LDI r3, 43
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
