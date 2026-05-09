; DESCRIPTION: Places a red line segment connecting (140, 201) to (461, 30).
; PLAN: r0=140(x1), r1=201(y1), r2=461(x2), r3=30(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 201
LDI r2, 461
LDI r3, 30
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
