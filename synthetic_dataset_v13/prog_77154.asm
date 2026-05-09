; DESCRIPTION: Draws a magenta rectangle at (337, 118) with width 92 and height 28.
; PLAN: r0=337(x), r1=118(y), r2=92(width), r3=28(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 118
LDI r2, 92
LDI r3, 28
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
