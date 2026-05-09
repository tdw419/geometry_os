; DESCRIPTION: Draws a blue rectangle at (163, 133) with width 17 and height 105.
; PLAN: r0=163(x), r1=133(y), r2=17(width), r3=105(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 133
LDI r2, 17
LDI r3, 105
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
