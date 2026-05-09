; DESCRIPTION: Draws a magenta rectangle at (231, 116) with width 114 and height 69.
; PLAN: r0=231(x), r1=116(y), r2=114(width), r3=69(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 116
LDI r2, 114
LDI r3, 69
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
