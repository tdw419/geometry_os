; DESCRIPTION: Draws a magenta rectangle at (194, 103) with width 28 and height 11.
; PLAN: r0=194(x), r1=103(y), r2=28(width), r3=11(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 103
LDI r2, 28
LDI r3, 11
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
