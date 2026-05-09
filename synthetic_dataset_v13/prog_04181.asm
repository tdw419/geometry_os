; DESCRIPTION: Draws a blue rectangle at (87, 15) with width 22 and height 98.
; PLAN: r0=87(x), r1=15(y), r2=22(width), r3=98(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 15
LDI r2, 22
LDI r3, 98
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
