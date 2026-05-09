; DESCRIPTION: Draws a purple line from (336, 192) to (248, 135).
; PLAN: r0=336(x1), r1=192(y1), r2=248(x2), r3=135(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 192
LDI r2, 248
LDI r3, 135
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
