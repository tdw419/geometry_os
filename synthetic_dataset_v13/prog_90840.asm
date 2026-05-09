; DESCRIPTION: Draws a blue rectangle at (87, 175) with width 84 and height 52.
; PLAN: r0=87(x), r1=175(y), r2=84(width), r3=52(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 175
LDI r2, 84
LDI r3, 52
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
