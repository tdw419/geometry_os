; DESCRIPTION: Draws a blue rectangle at (449, 56) with width 22 and height 19.
; PLAN: r0=449(x), r1=56(y), r2=22(width), r3=19(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 56
LDI r2, 22
LDI r3, 19
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
