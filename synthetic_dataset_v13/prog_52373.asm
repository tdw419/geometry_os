; DESCRIPTION: Draws a magenta rectangle at (65, 175) with width 30 and height 73.
; PLAN: r0=65(x), r1=175(y), r2=30(width), r3=73(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 175
LDI r2, 30
LDI r3, 73
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
