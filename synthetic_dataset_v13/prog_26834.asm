; DESCRIPTION: Renders a blue line between points (201, 251) and (414, 19).
; PLAN: r0=201(x1), r1=251(y1), r2=414(x2), r3=19(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 251
LDI r2, 414
LDI r3, 19
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
