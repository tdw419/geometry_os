; DESCRIPTION: Draws a magenta rectangle at (74, 5) with width 56 and height 96.
; PLAN: r0=74(x), r1=5(y), r2=56(width), r3=96(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 5
LDI r2, 56
LDI r3, 96
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
