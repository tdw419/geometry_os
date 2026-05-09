; DESCRIPTION: Draws a magenta rectangle at (256, 94) with width 108 and height 87.
; PLAN: r0=256(x), r1=94(y), r2=108(width), r3=87(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 94
LDI r2, 108
LDI r3, 87
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
