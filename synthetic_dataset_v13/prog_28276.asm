; DESCRIPTION: Draws a magenta rectangle at (212, 4) with width 73 and height 47.
; PLAN: r0=212(x), r1=4(y), r2=73(width), r3=47(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 4
LDI r2, 73
LDI r3, 47
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
