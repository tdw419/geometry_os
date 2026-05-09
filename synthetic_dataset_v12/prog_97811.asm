; DESCRIPTION: Draws a blue rectangle at (219, 74) with width 110 and height 102.
; PLAN: r0=219(x), r1=74(y), r2=110(width), r3=102(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 74
LDI r2, 110
LDI r3, 102
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
