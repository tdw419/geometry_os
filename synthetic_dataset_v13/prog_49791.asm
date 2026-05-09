; DESCRIPTION: Places a white line segment connecting (484, 180) to (489, 45).
; PLAN: r0=484(x1), r1=180(y1), r2=489(x2), r3=45(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 484
LDI r1, 180
LDI r2, 489
LDI r3, 45
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
