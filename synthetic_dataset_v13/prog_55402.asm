; DESCRIPTION: Draws a blue rectangle at (222, 11) with width 55 and height 73.
; PLAN: r0=222(x), r1=11(y), r2=55(width), r3=73(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 11
LDI r2, 55
LDI r3, 73
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
