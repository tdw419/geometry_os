; DESCRIPTION: Draws a blue rectangle at (222, 0) with width 119 and height 102.
; PLAN: r0=222(x), r1=0(y), r2=119(width), r3=102(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 0
LDI r2, 119
LDI r3, 102
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
