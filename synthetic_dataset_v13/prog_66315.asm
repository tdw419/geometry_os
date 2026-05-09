; DESCRIPTION: Draws a magenta rectangle at (58, 113) with width 109 and height 75.
; PLAN: r0=58(x), r1=113(y), r2=109(width), r3=75(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 113
LDI r2, 109
LDI r3, 75
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
