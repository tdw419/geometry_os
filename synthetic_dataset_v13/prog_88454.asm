; DESCRIPTION: Draws a magenta rectangle at (73, 49) with width 73 and height 96.
; PLAN: r0=73(x), r1=49(y), r2=73(width), r3=96(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 49
LDI r2, 73
LDI r3, 96
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
