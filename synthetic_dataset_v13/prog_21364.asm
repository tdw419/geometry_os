; DESCRIPTION: Draws a magenta rectangle at (118, 89) with width 41 and height 22.
; PLAN: r0=118(x), r1=89(y), r2=41(width), r3=22(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 89
LDI r2, 41
LDI r3, 22
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
