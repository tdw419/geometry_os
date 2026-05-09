; DESCRIPTION: Draws a blue rectangle at (184, 217) with width 53 and height 20.
; PLAN: r0=184(x), r1=217(y), r2=53(width), r3=20(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 217
LDI r2, 53
LDI r3, 20
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
