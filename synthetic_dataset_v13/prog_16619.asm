; DESCRIPTION: Draws a magenta rectangle at (177, 99) with width 113 and height 43.
; PLAN: r0=177(x), r1=99(y), r2=113(width), r3=43(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 99
LDI r2, 113
LDI r3, 43
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
