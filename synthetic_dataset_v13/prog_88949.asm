; DESCRIPTION: Places a red line segment connecting (389, 252) to (272, 119).
; PLAN: r0=389(x1), r1=252(y1), r2=272(x2), r3=119(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 252
LDI r2, 272
LDI r3, 119
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
