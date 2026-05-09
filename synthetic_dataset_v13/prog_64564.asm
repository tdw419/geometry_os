; DESCRIPTION: Draws a blue rectangle at (239, 141) with width 96 and height 51.
; PLAN: r0=239(x), r1=141(y), r2=96(width), r3=51(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 141
LDI r2, 96
LDI r3, 51
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
