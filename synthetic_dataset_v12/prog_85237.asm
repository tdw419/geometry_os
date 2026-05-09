; DESCRIPTION: Draws a purple rectangle at (355, 113) with width 35 and height 34.
; PLAN: r0=355(x), r1=113(y), r2=35(width), r3=34(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 113
LDI r2, 35
LDI r3, 34
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
