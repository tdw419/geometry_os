; DESCRIPTION: Places a red line segment connecting (439, 201) to (341, 67).
; PLAN: r0=439(x1), r1=201(y1), r2=341(x2), r3=67(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 201
LDI r2, 341
LDI r3, 67
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
