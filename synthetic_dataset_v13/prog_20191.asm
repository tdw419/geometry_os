; DESCRIPTION: Places a red line segment connecting (449, 85) to (201, 176).
; PLAN: r0=449(x1), r1=85(y1), r2=201(x2), r3=176(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 85
LDI r2, 201
LDI r3, 176
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
