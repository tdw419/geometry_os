; DESCRIPTION: Draws a purple rectangle at (199, 37) with width 117 and height 94.
; PLAN: r0=199(x), r1=37(y), r2=117(width), r3=94(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 37
LDI r2, 117
LDI r3, 94
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
