; DESCRIPTION: Draws a purple rectangle at (404, 240) with width 55 and height 15.
; PLAN: r0=404(x), r1=240(y), r2=55(width), r3=15(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 240
LDI r2, 55
LDI r3, 15
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
