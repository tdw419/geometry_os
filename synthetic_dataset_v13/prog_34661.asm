; DESCRIPTION: Draws a purple line from (159, 201) to (364, 16).
; PLAN: r0=159(x1), r1=201(y1), r2=364(x2), r3=16(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 201
LDI r2, 364
LDI r3, 16
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
