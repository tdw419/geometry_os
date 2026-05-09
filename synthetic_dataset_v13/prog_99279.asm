; DESCRIPTION: Draws a magenta rectangle at (52, 76) with width 13 and height 30.
; PLAN: r0=52(x), r1=76(y), r2=13(width), r3=30(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 76
LDI r2, 13
LDI r3, 30
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
