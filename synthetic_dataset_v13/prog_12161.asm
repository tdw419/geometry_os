; DESCRIPTION: Draws a magenta rectangle at (221, 75) with width 49 and height 114.
; PLAN: r0=221(x), r1=75(y), r2=49(width), r3=114(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 75
LDI r2, 49
LDI r3, 114
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
