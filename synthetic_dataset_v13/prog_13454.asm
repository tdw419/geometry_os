; DESCRIPTION: Draws a magenta rectangle at (265, 95) with width 52 and height 15.
; PLAN: r0=265(x), r1=95(y), r2=52(width), r3=15(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 95
LDI r2, 52
LDI r3, 15
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
