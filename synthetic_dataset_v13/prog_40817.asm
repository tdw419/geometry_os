; DESCRIPTION: Renders a purple line between points (245, 39) and (351, 201).
; PLAN: r0=245(x1), r1=39(y1), r2=351(x2), r3=201(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 39
LDI r2, 351
LDI r3, 201
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
