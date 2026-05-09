; DESCRIPTION: Draws a magenta rectangle at (114, 18) with width 87 and height 64.
; PLAN: r0=114(x), r1=18(y), r2=87(width), r3=64(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 18
LDI r2, 87
LDI r3, 64
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
