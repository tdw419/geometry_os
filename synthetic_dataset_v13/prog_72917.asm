; DESCRIPTION: Draws a magenta rectangle at (332, 81) with width 71 and height 25.
; PLAN: r0=332(x), r1=81(y), r2=71(width), r3=25(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 81
LDI r2, 71
LDI r3, 25
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
