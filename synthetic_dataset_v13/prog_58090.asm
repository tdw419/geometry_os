; DESCRIPTION: Draws a magenta rectangle at (194, 55) with width 28 and height 65.
; PLAN: r0=194(x), r1=55(y), r2=28(width), r3=65(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 55
LDI r2, 28
LDI r3, 65
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
