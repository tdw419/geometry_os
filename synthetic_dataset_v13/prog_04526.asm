; DESCRIPTION: Places a red line segment connecting (7, 92) to (508, 180).
; PLAN: r0=7(x1), r1=92(y1), r2=508(x2), r3=180(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 92
LDI r2, 508
LDI r3, 180
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
