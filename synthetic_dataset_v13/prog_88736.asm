; DESCRIPTION: Draws a purple rectangle at (389, 152) with width 56 and height 97.
; PLAN: r0=389(x), r1=152(y), r2=56(width), r3=97(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 152
LDI r2, 56
LDI r3, 97
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
