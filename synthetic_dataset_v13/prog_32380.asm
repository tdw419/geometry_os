; DESCRIPTION: Renders a blue line between points (248, 155) and (379, 66).
; PLAN: r0=248(x1), r1=155(y1), r2=379(x2), r3=66(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 155
LDI r2, 379
LDI r3, 66
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
