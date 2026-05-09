; DESCRIPTION: Draws a purple line from (293, 170) to (58, 97).
; PLAN: r0=293(x1), r1=170(y1), r2=58(x2), r3=97(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 170
LDI r2, 58
LDI r3, 97
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
