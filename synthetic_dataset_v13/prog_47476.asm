; DESCRIPTION: Draws a magenta rectangle at (158, 61) with width 120 and height 112.
; PLAN: r0=158(x), r1=61(y), r2=120(width), r3=112(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 61
LDI r2, 120
LDI r3, 112
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
