; DESCRIPTION: Draws a purple rectangle at (5, 145) with width 23 and height 105.
; PLAN: r0=5(x), r1=145(y), r2=23(width), r3=105(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 145
LDI r2, 23
LDI r3, 105
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
