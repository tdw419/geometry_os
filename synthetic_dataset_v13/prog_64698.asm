; DESCRIPTION: Draws a orange rectangle at (89, 136) with width 89 and height 11.
; PLAN: r0=89(x), r1=136(y), r2=89(width), r3=11(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 136
LDI r2, 89
LDI r3, 11
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
