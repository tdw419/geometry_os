; DESCRIPTION: Draws a magenta rectangle at (429, 32) with width 43 and height 15.
; PLAN: r0=429(x), r1=32(y), r2=43(width), r3=15(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 32
LDI r2, 43
LDI r3, 15
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
