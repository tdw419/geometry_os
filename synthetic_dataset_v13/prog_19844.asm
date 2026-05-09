; DESCRIPTION: Draws a blue rectangle at (101, 86) with width 87 and height 110.
; PLAN: r0=101(x), r1=86(y), r2=87(width), r3=110(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 86
LDI r2, 87
LDI r3, 110
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
