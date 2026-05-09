; DESCRIPTION: Renders a purple line between points (1, 18) and (308, 201).
; PLAN: r0=1(x1), r1=18(y1), r2=308(x2), r3=201(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 18
LDI r2, 308
LDI r3, 201
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
