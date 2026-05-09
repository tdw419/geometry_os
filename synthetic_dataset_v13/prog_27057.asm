; DESCRIPTION: Draws a magenta rectangle at (17, 22) with width 43 and height 71.
; PLAN: r0=17(x), r1=22(y), r2=43(width), r3=71(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 22
LDI r2, 43
LDI r3, 71
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
