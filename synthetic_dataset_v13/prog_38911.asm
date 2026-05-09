; DESCRIPTION: Draws a magenta rectangle at (1, 4) with width 81 and height 91.
; PLAN: r0=1(x), r1=4(y), r2=81(width), r3=91(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 4
LDI r2, 81
LDI r3, 91
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
