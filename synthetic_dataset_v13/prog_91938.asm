; DESCRIPTION: Draws a magenta rectangle at (320, 114) with width 64 and height 66.
; PLAN: r0=320(x), r1=114(y), r2=64(width), r3=66(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 114
LDI r2, 64
LDI r3, 66
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
