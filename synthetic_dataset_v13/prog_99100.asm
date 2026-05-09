; DESCRIPTION: Draws a magenta rectangle at (176, 230) with width 99 and height 13.
; PLAN: r0=176(x), r1=230(y), r2=99(width), r3=13(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 230
LDI r2, 99
LDI r3, 13
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
