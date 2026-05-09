; DESCRIPTION: Draws a magenta rectangle at (376, 84) with width 36 and height 91.
; PLAN: r0=376(x), r1=84(y), r2=36(width), r3=91(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 84
LDI r2, 36
LDI r3, 91
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
