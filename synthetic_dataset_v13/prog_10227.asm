; DESCRIPTION: Draws a magenta rectangle at (167, 16) with width 96 and height 88.
; PLAN: r0=167(x), r1=16(y), r2=96(width), r3=88(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 16
LDI r2, 96
LDI r3, 88
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
