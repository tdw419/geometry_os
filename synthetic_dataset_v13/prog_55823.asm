; DESCRIPTION: Draws a magenta rectangle at (348, 126) with width 43 and height 56.
; PLAN: r0=348(x), r1=126(y), r2=43(width), r3=56(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 126
LDI r2, 43
LDI r3, 56
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
