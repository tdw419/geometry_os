; DESCRIPTION: Draws a magenta rectangle at (416, 180) with width 80 and height 37.
; PLAN: r0=416(x), r1=180(y), r2=80(width), r3=37(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 180
LDI r2, 80
LDI r3, 37
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
