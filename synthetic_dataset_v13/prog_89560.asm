; DESCRIPTION: Draws a purple line from (204, 183) to (128, 201).
; PLAN: r0=204(x1), r1=183(y1), r2=128(x2), r3=201(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 183
LDI r2, 128
LDI r3, 201
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
