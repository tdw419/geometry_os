; DESCRIPTION: Draws a purple rectangle at (404, 51) with width 29 and height 34.
; PLAN: r0=404(x), r1=51(y), r2=29(width), r3=34(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 51
LDI r2, 29
LDI r3, 34
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
