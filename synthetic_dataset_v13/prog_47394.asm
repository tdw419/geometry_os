; DESCRIPTION: Places a red line segment connecting (477, 51) to (201, 99).
; PLAN: r0=477(x1), r1=51(y1), r2=201(x2), r3=99(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 477
LDI r1, 51
LDI r2, 201
LDI r3, 99
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
