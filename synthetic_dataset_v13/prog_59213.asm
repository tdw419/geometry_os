; DESCRIPTION: Draws a magenta rectangle at (216, 95) with width 82 and height 118.
; PLAN: r0=216(x), r1=95(y), r2=82(width), r3=118(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 95
LDI r2, 82
LDI r3, 118
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
