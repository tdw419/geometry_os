; DESCRIPTION: Draws a magenta rectangle at (44, 92) with width 93 and height 107.
; PLAN: r0=44(x), r1=92(y), r2=93(width), r3=107(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 92
LDI r2, 93
LDI r3, 107
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
