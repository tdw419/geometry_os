; DESCRIPTION: Draws a magenta rectangle at (118, 178) with width 78 and height 71.
; PLAN: r0=118(x), r1=178(y), r2=78(width), r3=71(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 178
LDI r2, 78
LDI r3, 71
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
