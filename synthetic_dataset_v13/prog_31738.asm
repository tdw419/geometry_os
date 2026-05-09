; DESCRIPTION: Renders a blue line between points (378, 23) and (323, 201).
; PLAN: r0=378(x1), r1=23(y1), r2=323(x2), r3=201(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 23
LDI r2, 323
LDI r3, 201
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
