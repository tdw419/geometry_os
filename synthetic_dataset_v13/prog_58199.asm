; DESCRIPTION: Draws a blue rectangle at (230, 172) with width 96 and height 30.
; PLAN: r0=230(x), r1=172(y), r2=96(width), r3=30(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 172
LDI r2, 96
LDI r3, 30
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
