; DESCRIPTION: Draws a magenta rectangle at (107, 25) with width 73 and height 69.
; PLAN: r0=107(x), r1=25(y), r2=73(width), r3=69(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 25
LDI r2, 73
LDI r3, 69
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
