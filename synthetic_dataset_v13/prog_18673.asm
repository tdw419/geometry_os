; DESCRIPTION: Draws a purple rectangle at (133, 113) with width 65 and height 34.
; PLAN: r0=133(x), r1=113(y), r2=65(width), r3=34(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 113
LDI r2, 65
LDI r3, 34
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
