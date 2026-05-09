; DESCRIPTION: Draws a blue rectangle at (22, 66) with width 75 and height 56.
; PLAN: r0=22(x), r1=66(y), r2=75(width), r3=56(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 66
LDI r2, 75
LDI r3, 56
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
