; DESCRIPTION: Draws a magenta rectangle at (151, 30) with width 52 and height 79.
; PLAN: r0=151(x), r1=30(y), r2=52(width), r3=79(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 30
LDI r2, 52
LDI r3, 79
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
