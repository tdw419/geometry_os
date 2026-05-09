; DESCRIPTION: Places a red line segment connecting (379, 201) to (431, 211).
; PLAN: r0=379(x1), r1=201(y1), r2=431(x2), r3=211(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 201
LDI r2, 431
LDI r3, 211
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
