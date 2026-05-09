; DESCRIPTION: Draws a magenta rectangle at (101, 210) with width 55 and height 43.
; PLAN: r0=101(x), r1=210(y), r2=55(width), r3=43(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 210
LDI r2, 55
LDI r3, 43
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
