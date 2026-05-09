; DESCRIPTION: Draws a magenta rectangle at (77, 158) with width 82 and height 33.
; PLAN: r0=77(x), r1=158(y), r2=82(width), r3=33(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 158
LDI r2, 82
LDI r3, 33
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
