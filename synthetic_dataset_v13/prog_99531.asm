; DESCRIPTION: Draws a blue rectangle at (299, 19) with width 55 and height 76.
; PLAN: r0=299(x), r1=19(y), r2=55(width), r3=76(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 19
LDI r2, 55
LDI r3, 76
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
