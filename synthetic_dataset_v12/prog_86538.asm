; DESCRIPTION: Draws a blue rectangle at (322, 3) with width 19 and height 95.
; PLAN: r0=322(x), r1=3(y), r2=19(width), r3=95(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 3
LDI r2, 19
LDI r3, 95
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
