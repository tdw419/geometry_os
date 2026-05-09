; DESCRIPTION: Draws a purple line from (294, 201) to (444, 114).
; PLAN: r0=294(x1), r1=201(y1), r2=444(x2), r3=114(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 201
LDI r2, 444
LDI r3, 114
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
