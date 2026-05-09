; DESCRIPTION: Draws a purple rectangle at (352, 169) with width 70 and height 84.
; PLAN: r0=352(x), r1=169(y), r2=70(width), r3=84(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 169
LDI r2, 70
LDI r3, 84
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
