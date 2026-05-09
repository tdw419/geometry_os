; DESCRIPTION: Draws a orange rectangle at (287, 70) with width 99 and height 63.
; PLAN: r0=287(x), r1=70(y), r2=99(width), r3=63(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 70
LDI r2, 99
LDI r3, 63
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
