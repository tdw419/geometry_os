; DESCRIPTION: Draws a blue rectangle at (409, 70) with width 19 and height 31.
; PLAN: r0=409(x), r1=70(y), r2=19(width), r3=31(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 70
LDI r2, 19
LDI r3, 31
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
