; DESCRIPTION: Draws a purple rectangle at (94, 152) with width 43 and height 36.
; PLAN: r0=94(x), r1=152(y), r2=43(width), r3=36(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 152
LDI r2, 43
LDI r3, 36
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
