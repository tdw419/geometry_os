; DESCRIPTION: Renders a purple line between points (367, 253) and (259, 201).
; PLAN: r0=367(x1), r1=253(y1), r2=259(x2), r3=201(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 253
LDI r2, 259
LDI r3, 201
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
