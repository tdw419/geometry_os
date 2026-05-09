; DESCRIPTION: Places a red line segment connecting (100, 56) to (141, 54).
; PLAN: r0=100(x1), r1=56(y1), r2=141(x2), r3=54(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 56
LDI r2, 141
LDI r3, 54
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
