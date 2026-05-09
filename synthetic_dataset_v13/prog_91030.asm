; DESCRIPTION: Draws a magenta rectangle at (65, 37) with width 101 and height 113.
; PLAN: r0=65(x), r1=37(y), r2=101(width), r3=113(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 37
LDI r2, 101
LDI r3, 113
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
