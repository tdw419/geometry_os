; DESCRIPTION: Draws a magenta rectangle at (189, 178) with width 19 and height 17.
; PLAN: r0=189(x), r1=178(y), r2=19(width), r3=17(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 178
LDI r2, 19
LDI r3, 17
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
