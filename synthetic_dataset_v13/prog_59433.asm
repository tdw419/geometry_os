; DESCRIPTION: Draws a magenta rectangle at (69, 105) with width 81 and height 17.
; PLAN: r0=69(x), r1=105(y), r2=81(width), r3=17(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 105
LDI r2, 81
LDI r3, 17
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
