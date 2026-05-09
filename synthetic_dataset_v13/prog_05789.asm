; DESCRIPTION: Draws a orange rectangle at (63, 113) with width 11 and height 54.
; PLAN: r0=63(x), r1=113(y), r2=11(width), r3=54(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 113
LDI r2, 11
LDI r3, 54
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
