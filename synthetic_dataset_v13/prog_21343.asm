; DESCRIPTION: Draws a purple line from (144, 201) to (286, 44).
; PLAN: r0=144(x1), r1=201(y1), r2=286(x2), r3=44(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 201
LDI r2, 286
LDI r3, 44
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
