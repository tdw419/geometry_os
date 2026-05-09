; DESCRIPTION: Draws a magenta rectangle at (259, 150) with width 103 and height 22.
; PLAN: r0=259(x), r1=150(y), r2=103(width), r3=22(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 150
LDI r2, 103
LDI r3, 22
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
