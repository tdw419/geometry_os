; DESCRIPTION: Draws a magenta rectangle at (229, 64) with width 26 and height 13.
; PLAN: r0=229(x), r1=64(y), r2=26(width), r3=13(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 64
LDI r2, 26
LDI r3, 13
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
