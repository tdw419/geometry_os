; DESCRIPTION: Draws a purple rectangle at (377, 113) with width 12 and height 112.
; PLAN: r0=377(x), r1=113(y), r2=12(width), r3=112(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 113
LDI r2, 12
LDI r3, 112
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
