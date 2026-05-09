; DESCRIPTION: Draws a magenta rectangle at (120, 99) with width 73 and height 109.
; PLAN: r0=120(x), r1=99(y), r2=73(width), r3=109(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 99
LDI r2, 73
LDI r3, 109
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
