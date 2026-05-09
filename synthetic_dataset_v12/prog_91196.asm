; DESCRIPTION: Draws a orange rectangle at (133, 84) with width 85 and height 112.
; PLAN: r0=133(x), r1=84(y), r2=85(width), r3=112(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 84
LDI r2, 85
LDI r3, 112
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
