; DESCRIPTION: Places a red line segment connecting (45, 100) to (411, 89).
; PLAN: r0=45(x1), r1=100(y1), r2=411(x2), r3=89(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 100
LDI r2, 411
LDI r3, 89
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
