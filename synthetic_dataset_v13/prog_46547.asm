; DESCRIPTION: Draws a magenta rectangle at (169, 185) with width 119 and height 41.
; PLAN: r0=169(x), r1=185(y), r2=119(width), r3=41(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 185
LDI r2, 119
LDI r3, 41
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
