; DESCRIPTION: Draws a magenta rectangle at (317, 113) with width 34 and height 87.
; PLAN: r0=317(x), r1=113(y), r2=34(width), r3=87(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 113
LDI r2, 34
LDI r3, 87
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
