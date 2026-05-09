; DESCRIPTION: Draws a magenta rectangle at (15, 153) with width 38 and height 73.
; PLAN: r0=15(x), r1=153(y), r2=38(width), r3=73(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 153
LDI r2, 38
LDI r3, 73
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
