; DESCRIPTION: Draws a blue rectangle at (451, 40) with width 18 and height 105.
; PLAN: r0=451(x), r1=40(y), r2=18(width), r3=105(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 451
LDI r1, 40
LDI r2, 18
LDI r3, 105
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
