; DESCRIPTION: Draws a magenta rectangle at (371, 35) with width 98 and height 95.
; PLAN: r0=371(x), r1=35(y), r2=98(width), r3=95(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 35
LDI r2, 98
LDI r3, 95
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
