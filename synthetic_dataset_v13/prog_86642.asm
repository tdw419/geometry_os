; DESCRIPTION: Draws a blue rectangle at (227, 32) with width 70 and height 20.
; PLAN: r0=227(x), r1=32(y), r2=70(width), r3=20(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 32
LDI r2, 70
LDI r3, 20
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
