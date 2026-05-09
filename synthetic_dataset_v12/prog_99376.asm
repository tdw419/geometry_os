; DESCRIPTION: Draws a magenta rectangle at (56, 84) with width 16 and height 109.
; PLAN: r0=56(x), r1=84(y), r2=16(width), r3=109(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 84
LDI r2, 16
LDI r3, 109
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
