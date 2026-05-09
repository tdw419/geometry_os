; DESCRIPTION: Draws a purple rectangle at (132, 108) with width 92 and height 118.
; PLAN: r0=132(x), r1=108(y), r2=92(width), r3=118(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 108
LDI r2, 92
LDI r3, 118
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
