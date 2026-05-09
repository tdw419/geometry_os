; DESCRIPTION: Draws a blue rectangle at (238, 219) with width 104 and height 18.
; PLAN: r0=238(x), r1=219(y), r2=104(width), r3=18(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 219
LDI r2, 104
LDI r3, 18
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
