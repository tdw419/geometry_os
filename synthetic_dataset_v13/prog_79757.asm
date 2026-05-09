; DESCRIPTION: Draws a blue rectangle at (353, 97) with width 51 and height 98.
; PLAN: r0=353(x), r1=97(y), r2=51(width), r3=98(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 97
LDI r2, 51
LDI r3, 98
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
