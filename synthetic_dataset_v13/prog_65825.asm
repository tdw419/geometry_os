; DESCRIPTION: Draws a purple rectangle at (404, 111) with width 66 and height 20.
; PLAN: r0=404(x), r1=111(y), r2=66(width), r3=20(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 111
LDI r2, 66
LDI r3, 20
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
