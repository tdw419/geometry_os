; DESCRIPTION: Draws a magenta rectangle at (90, 90) with width 81 and height 49.
; PLAN: r0=90(x), r1=90(y), r2=81(width), r3=49(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 90
LDI r2, 81
LDI r3, 49
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
