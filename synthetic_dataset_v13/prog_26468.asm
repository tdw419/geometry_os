; DESCRIPTION: Draws a blue rectangle at (371, 3) with width 52 and height 35.
; PLAN: r0=371(x), r1=3(y), r2=52(width), r3=35(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 3
LDI r2, 52
LDI r3, 35
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
