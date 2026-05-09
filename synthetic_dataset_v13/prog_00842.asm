; DESCRIPTION: Draws a magenta rectangle at (81, 150) with width 102 and height 37.
; PLAN: r0=81(x), r1=150(y), r2=102(width), r3=37(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 150
LDI r2, 102
LDI r3, 37
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
