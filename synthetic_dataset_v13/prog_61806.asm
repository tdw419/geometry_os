; DESCRIPTION: Draws a blue rectangle at (451, 25) with width 11 and height 58.
; PLAN: r0=451(x), r1=25(y), r2=11(width), r3=58(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 451
LDI r1, 25
LDI r2, 11
LDI r3, 58
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
