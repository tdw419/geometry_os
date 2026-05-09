; DESCRIPTION: Draws a magenta rectangle at (285, 203) with width 63 and height 13.
; PLAN: r0=285(x), r1=203(y), r2=63(width), r3=13(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 203
LDI r2, 63
LDI r3, 13
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
