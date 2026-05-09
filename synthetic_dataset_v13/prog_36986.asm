; DESCRIPTION: Draws a magenta rectangle at (47, 206) with width 110 and height 36.
; PLAN: r0=47(x), r1=206(y), r2=110(width), r3=36(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 206
LDI r2, 110
LDI r3, 36
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
