; DESCRIPTION: Draws a blue rectangle at (338, 156) with width 52 and height 36.
; PLAN: r0=338(x), r1=156(y), r2=52(width), r3=36(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 156
LDI r2, 52
LDI r3, 36
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
