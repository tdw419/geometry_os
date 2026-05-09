; DESCRIPTION: Places a orange line segment connecting (233, 169) to (308, 80).
; PLAN: r0=233(x1), r1=169(y1), r2=308(x2), r3=80(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 169
LDI r2, 308
LDI r3, 80
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
