; DESCRIPTION: Draws a magenta rectangle at (352, 60) with width 73 and height 88.
; PLAN: r0=352(x), r1=60(y), r2=73(width), r3=88(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 60
LDI r2, 73
LDI r3, 88
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
