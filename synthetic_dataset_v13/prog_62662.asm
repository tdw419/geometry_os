; DESCRIPTION: Draws a blue rectangle at (8, 30) with width 19 and height 100.
; PLAN: r0=8(x), r1=30(y), r2=19(width), r3=100(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 30
LDI r2, 19
LDI r3, 100
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
