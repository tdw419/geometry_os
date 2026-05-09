; DESCRIPTION: Places a red line segment connecting (2, 87) to (80, 158).
; PLAN: r0=2(x1), r1=87(y1), r2=80(x2), r3=158(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 87
LDI r2, 80
LDI r3, 158
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
