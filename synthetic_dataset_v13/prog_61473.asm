; DESCRIPTION: Draws a purple rectangle at (404, 84) with width 70 and height 23.
; PLAN: r0=404(x), r1=84(y), r2=70(width), r3=23(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 84
LDI r2, 70
LDI r3, 23
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
