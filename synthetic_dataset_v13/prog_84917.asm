; DESCRIPTION: Draws a magenta rectangle at (52, 36) with width 77 and height 114.
; PLAN: r0=52(x), r1=36(y), r2=77(width), r3=114(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 36
LDI r2, 77
LDI r3, 114
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
