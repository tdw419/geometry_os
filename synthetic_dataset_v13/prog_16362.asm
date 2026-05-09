; DESCRIPTION: Draws a magenta rectangle at (29, 82) with width 96 and height 118.
; PLAN: r0=29(x), r1=82(y), r2=96(width), r3=118(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 82
LDI r2, 96
LDI r3, 118
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
