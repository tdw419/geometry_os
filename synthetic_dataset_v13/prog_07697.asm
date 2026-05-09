; DESCRIPTION: Renders a blue line between points (37, 204) and (379, 201).
; PLAN: r0=37(x1), r1=204(y1), r2=379(x2), r3=201(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 204
LDI r2, 379
LDI r3, 201
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
