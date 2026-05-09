; DESCRIPTION: Draws a blue rectangle at (322, 100) with width 106 and height 29.
; PLAN: r0=322(x), r1=100(y), r2=106(width), r3=29(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 100
LDI r2, 106
LDI r3, 29
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
