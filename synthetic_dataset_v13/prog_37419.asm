; DESCRIPTION: Draws a magenta rectangle at (323, 76) with width 36 and height 19.
; PLAN: r0=323(x), r1=76(y), r2=36(width), r3=19(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 76
LDI r2, 36
LDI r3, 19
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
