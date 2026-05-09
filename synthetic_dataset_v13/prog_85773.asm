; DESCRIPTION: Draws a blue rectangle at (17, 135) with width 35 and height 95.
; PLAN: r0=17(x), r1=135(y), r2=35(width), r3=95(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 135
LDI r2, 35
LDI r3, 95
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
