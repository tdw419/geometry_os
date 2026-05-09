; DESCRIPTION: Places a white line segment connecting (201, 211) to (190, 79).
; PLAN: r0=201(x1), r1=211(y1), r2=190(x2), r3=79(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 211
LDI r2, 190
LDI r3, 79
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
