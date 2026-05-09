; DESCRIPTION: Draws a magenta rectangle at (136, 7) with width 93 and height 79.
; PLAN: r0=136(x), r1=7(y), r2=93(width), r3=79(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 7
LDI r2, 93
LDI r3, 79
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
