; DESCRIPTION: Draws a magenta rectangle at (61, 23) with width 85 and height 73.
; PLAN: r0=61(x), r1=23(y), r2=85(width), r3=73(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 23
LDI r2, 85
LDI r3, 73
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
