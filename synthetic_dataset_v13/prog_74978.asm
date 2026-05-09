; DESCRIPTION: Places a red line segment connecting (293, 131) to (423, 34).
; PLAN: r0=293(x1), r1=131(y1), r2=423(x2), r3=34(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 131
LDI r2, 423
LDI r3, 34
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
