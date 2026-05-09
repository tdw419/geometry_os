; DESCRIPTION: Draws a magenta rectangle at (259, 28) with width 112 and height 106.
; PLAN: r0=259(x), r1=28(y), r2=112(width), r3=106(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 28
LDI r2, 112
LDI r3, 106
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
