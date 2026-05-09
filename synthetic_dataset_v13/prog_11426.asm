; DESCRIPTION: Draws a magenta rectangle at (17, 118) with width 88 and height 72.
; PLAN: r0=17(x), r1=118(y), r2=88(width), r3=72(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 118
LDI r2, 88
LDI r3, 72
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
