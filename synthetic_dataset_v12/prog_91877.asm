; DESCRIPTION: Draws a magenta rectangle at (136, 16) with width 108 and height 60.
; PLAN: r0=136(x), r1=16(y), r2=108(width), r3=60(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 16
LDI r2, 108
LDI r3, 60
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
