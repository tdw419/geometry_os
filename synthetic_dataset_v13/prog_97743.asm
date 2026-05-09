; DESCRIPTION: Draws a magenta rectangle at (452, 96) with width 40 and height 101.
; PLAN: r0=452(x), r1=96(y), r2=40(width), r3=101(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 452
LDI r1, 96
LDI r2, 40
LDI r3, 101
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
