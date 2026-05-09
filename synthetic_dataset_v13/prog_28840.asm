; DESCRIPTION: Draws a orange rectangle at (287, 88) with width 87 and height 55.
; PLAN: r0=287(x), r1=88(y), r2=87(width), r3=55(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 88
LDI r2, 87
LDI r3, 55
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
