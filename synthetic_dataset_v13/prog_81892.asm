; DESCRIPTION: Draws a magenta rectangle at (28, 78) with width 98 and height 115.
; PLAN: r0=28(x), r1=78(y), r2=98(width), r3=115(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 78
LDI r2, 98
LDI r3, 115
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
