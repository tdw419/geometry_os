; DESCRIPTION: Draws a purple rectangle at (400, 21) with width 38 and height 94.
; PLAN: r0=400(x), r1=21(y), r2=38(width), r3=94(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 21
LDI r2, 38
LDI r3, 94
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
