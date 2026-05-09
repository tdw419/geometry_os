; DESCRIPTION: Draws a magenta rectangle at (41, 136) with width 65 and height 102.
; PLAN: r0=41(x), r1=136(y), r2=65(width), r3=102(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 136
LDI r2, 65
LDI r3, 102
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
