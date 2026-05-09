; DESCRIPTION: Draws a magenta rectangle at (85, 77) with width 43 and height 32.
; PLAN: r0=85(x), r1=77(y), r2=43(width), r3=32(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 77
LDI r2, 43
LDI r3, 32
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
