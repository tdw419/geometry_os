; DESCRIPTION: Places a white line segment connecting (308, 169) to (201, 35).
; PLAN: r0=308(x1), r1=169(y1), r2=201(x2), r3=35(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 169
LDI r2, 201
LDI r3, 35
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
