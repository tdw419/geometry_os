; DESCRIPTION: Draws a magenta rectangle at (115, 122) with width 27 and height 84.
; PLAN: r0=115(x), r1=122(y), r2=27(width), r3=84(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 122
LDI r2, 27
LDI r3, 84
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
