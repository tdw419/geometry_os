; DESCRIPTION: Draws a blue rectangle at (418, 43) with width 80 and height 110.
; PLAN: r0=418(x), r1=43(y), r2=80(width), r3=110(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 43
LDI r2, 80
LDI r3, 110
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
