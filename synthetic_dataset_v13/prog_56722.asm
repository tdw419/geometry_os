; DESCRIPTION: Draws a purple line from (18, 253) to (357, 201).
; PLAN: r0=18(x1), r1=253(y1), r2=357(x2), r3=201(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 253
LDI r2, 357
LDI r3, 201
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
