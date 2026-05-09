; DESCRIPTION: Draws a purple line from (192, 176) to (122, 1).
; PLAN: r0=192(x1), r1=176(y1), r2=122(x2), r3=1(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 176
LDI r2, 122
LDI r3, 1
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
