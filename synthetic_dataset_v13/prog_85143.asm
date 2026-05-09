; DESCRIPTION: Draws a blue rectangle at (418, 1) with width 51 and height 43.
; PLAN: r0=418(x), r1=1(y), r2=51(width), r3=43(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 1
LDI r2, 51
LDI r3, 43
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
