; DESCRIPTION: Draws a magenta rectangle at (360, 132) with width 59 and height 70.
; PLAN: r0=360(x), r1=132(y), r2=59(width), r3=70(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 132
LDI r2, 59
LDI r3, 70
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
