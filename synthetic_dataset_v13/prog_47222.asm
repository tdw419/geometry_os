; DESCRIPTION: Draws a purple line from (351, 40) to (176, 47).
; PLAN: r0=351(x1), r1=40(y1), r2=176(x2), r3=47(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 40
LDI r2, 176
LDI r3, 47
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
