; DESCRIPTION: Draws a magenta rectangle at (99, 72) with width 38 and height 112.
; PLAN: r0=99(x), r1=72(y), r2=38(width), r3=112(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 72
LDI r2, 38
LDI r3, 112
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
