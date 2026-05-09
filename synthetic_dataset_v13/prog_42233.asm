; DESCRIPTION: Draws a purple line from (192, 12) to (248, 56).
; PLAN: r0=192(x1), r1=12(y1), r2=248(x2), r3=56(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 12
LDI r2, 248
LDI r3, 56
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
