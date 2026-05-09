; DESCRIPTION: Draws a magenta rectangle at (416, 33) with width 74 and height 95.
; PLAN: r0=416(x), r1=33(y), r2=74(width), r3=95(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 33
LDI r2, 74
LDI r3, 95
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
