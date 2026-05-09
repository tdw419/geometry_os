; DESCRIPTION: Draws a magenta rectangle at (261, 84) with width 16 and height 66.
; PLAN: r0=261(x), r1=84(y), r2=16(width), r3=66(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 84
LDI r2, 16
LDI r3, 66
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
