; DESCRIPTION: Draws a purple rectangle at (243, 113) with width 119 and height 19.
; PLAN: r0=243(x), r1=113(y), r2=119(width), r3=19(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 113
LDI r2, 119
LDI r3, 19
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
