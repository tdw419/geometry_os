; DESCRIPTION: Draws a magenta rectangle at (101, 123) with width 101 and height 32.
; PLAN: r0=101(x), r1=123(y), r2=101(width), r3=32(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 123
LDI r2, 101
LDI r3, 32
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
