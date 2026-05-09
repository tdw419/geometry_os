; DESCRIPTION: Draws a magenta rectangle at (385, 175) with width 95 and height 21.
; PLAN: r0=385(x), r1=175(y), r2=95(width), r3=21(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 175
LDI r2, 95
LDI r3, 21
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
