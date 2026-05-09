; DESCRIPTION: Draws a orange rectangle at (68, 133) with width 110 and height 18.
; PLAN: r0=68(x), r1=133(y), r2=110(width), r3=18(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 133
LDI r2, 110
LDI r3, 18
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
