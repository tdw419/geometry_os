; DESCRIPTION: Draws a magenta rectangle at (348, 142) with width 65 and height 101.
; PLAN: r0=348(x), r1=142(y), r2=65(width), r3=101(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 142
LDI r2, 65
LDI r3, 101
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
