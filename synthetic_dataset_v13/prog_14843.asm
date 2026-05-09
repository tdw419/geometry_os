; DESCRIPTION: Draws a blue rectangle at (56, 32) with width 89 and height 19.
; PLAN: r0=56(x), r1=32(y), r2=89(width), r3=19(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 32
LDI r2, 89
LDI r3, 19
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
