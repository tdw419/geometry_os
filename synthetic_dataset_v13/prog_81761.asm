; DESCRIPTION: Draws a blue rectangle at (419, 113) with width 54 and height 76.
; PLAN: r0=419(x), r1=113(y), r2=54(width), r3=76(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 113
LDI r2, 54
LDI r3, 76
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
