; DESCRIPTION: Draws a magenta rectangle at (312, 55) with width 113 and height 90.
; PLAN: r0=312(x), r1=55(y), r2=113(width), r3=90(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 55
LDI r2, 113
LDI r3, 90
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
