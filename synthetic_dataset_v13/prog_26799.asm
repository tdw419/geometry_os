; DESCRIPTION: Draws a purple line from (157, 224) to (204, 80).
; PLAN: r0=157(x1), r1=224(y1), r2=204(x2), r3=80(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 224
LDI r2, 204
LDI r3, 80
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
