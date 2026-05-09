; DESCRIPTION: Places a red line segment connecting (508, 100) to (330, 142).
; PLAN: r0=508(x1), r1=100(y1), r2=330(x2), r3=142(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 508
LDI r1, 100
LDI r2, 330
LDI r3, 142
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
