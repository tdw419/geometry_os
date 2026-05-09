; DESCRIPTION: Draws a magenta rectangle at (17, 60) with width 116 and height 35.
; PLAN: r0=17(x), r1=60(y), r2=116(width), r3=35(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 60
LDI r2, 116
LDI r3, 35
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
