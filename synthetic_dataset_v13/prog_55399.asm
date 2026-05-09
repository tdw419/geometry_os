; DESCRIPTION: Draws a purple line from (323, 91) to (418, 104).
; PLAN: r0=323(x1), r1=91(y1), r2=418(x2), r3=104(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 91
LDI r2, 418
LDI r3, 104
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
