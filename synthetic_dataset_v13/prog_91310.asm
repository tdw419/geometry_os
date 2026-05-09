; DESCRIPTION: Places a red line segment connecting (477, 66) to (462, 80).
; PLAN: r0=477(x1), r1=66(y1), r2=462(x2), r3=80(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 477
LDI r1, 66
LDI r2, 462
LDI r3, 80
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
