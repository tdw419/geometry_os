; DESCRIPTION: Draws a magenta rectangle at (58, 145) with width 58 and height 52.
; PLAN: r0=58(x), r1=145(y), r2=58(width), r3=52(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 145
LDI r2, 58
LDI r3, 52
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
