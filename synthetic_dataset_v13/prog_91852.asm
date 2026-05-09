; DESCRIPTION: Draws a magenta rectangle at (114, 3) with width 76 and height 96.
; PLAN: r0=114(x), r1=3(y), r2=76(width), r3=96(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 3
LDI r2, 76
LDI r3, 96
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
