; DESCRIPTION: Places a red line segment connecting (200, 76) to (31, 220).
; PLAN: r0=200(x1), r1=76(y1), r2=31(x2), r3=220(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 76
LDI r2, 31
LDI r3, 220
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
