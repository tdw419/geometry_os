; DESCRIPTION: Draws a magenta rectangle at (383, 6) with width 100 and height 112.
; PLAN: r0=383(x), r1=6(y), r2=100(width), r3=112(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 6
LDI r2, 100
LDI r3, 112
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
