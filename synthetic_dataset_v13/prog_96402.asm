; DESCRIPTION: Draws a magenta rectangle at (440, 144) with width 19 and height 13.
; PLAN: r0=440(x), r1=144(y), r2=19(width), r3=13(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 144
LDI r2, 19
LDI r3, 13
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
