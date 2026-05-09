; DESCRIPTION: Draws a magenta rectangle at (165, 115) with width 94 and height 118.
; PLAN: r0=165(x), r1=115(y), r2=94(width), r3=118(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 115
LDI r2, 94
LDI r3, 118
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
