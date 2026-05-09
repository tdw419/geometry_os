; DESCRIPTION: Draws a magenta rectangle at (322, 118) with width 62 and height 117.
; PLAN: r0=322(x), r1=118(y), r2=62(width), r3=117(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 118
LDI r2, 62
LDI r3, 117
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
