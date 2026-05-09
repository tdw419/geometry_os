; DESCRIPTION: Draws a purple rectangle at (249, 113) with width 85 and height 94.
; PLAN: r0=249(x), r1=113(y), r2=85(width), r3=94(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 113
LDI r2, 85
LDI r3, 94
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
