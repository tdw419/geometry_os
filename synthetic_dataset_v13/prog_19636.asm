; DESCRIPTION: Draws a purple line from (38, 38) to (155, 224).
; PLAN: r0=38(x1), r1=38(y1), r2=155(x2), r3=224(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 38
LDI r2, 155
LDI r3, 224
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
