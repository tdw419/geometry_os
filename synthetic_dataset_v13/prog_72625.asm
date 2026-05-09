; DESCRIPTION: Draws a magenta rectangle at (231, 122) with width 88 and height 63.
; PLAN: r0=231(x), r1=122(y), r2=88(width), r3=63(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 122
LDI r2, 88
LDI r3, 63
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
