; DESCRIPTION: Draws a magenta rectangle at (402, 14) with width 41 and height 106.
; PLAN: r0=402(x), r1=14(y), r2=41(width), r3=106(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 14
LDI r2, 41
LDI r3, 106
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
