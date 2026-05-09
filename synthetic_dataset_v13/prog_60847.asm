; DESCRIPTION: Draws a magenta rectangle at (138, 119) with width 96 and height 17.
; PLAN: r0=138(x), r1=119(y), r2=96(width), r3=17(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 119
LDI r2, 96
LDI r3, 17
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
