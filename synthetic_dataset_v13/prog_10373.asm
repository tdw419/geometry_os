; DESCRIPTION: Draws a magenta rectangle at (136, 68) with width 38 and height 41.
; PLAN: r0=136(x), r1=68(y), r2=38(width), r3=41(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 68
LDI r2, 38
LDI r3, 41
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
