; DESCRIPTION: Draws a magenta rectangle at (371, 108) with width 15 and height 99.
; PLAN: r0=371(x), r1=108(y), r2=15(width), r3=99(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 108
LDI r2, 15
LDI r3, 99
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
