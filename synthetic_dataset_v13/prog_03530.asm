; DESCRIPTION: Places a red line segment connecting (140, 201) to (388, 85).
; PLAN: r0=140(x1), r1=201(y1), r2=388(x2), r3=85(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 201
LDI r2, 388
LDI r3, 85
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
