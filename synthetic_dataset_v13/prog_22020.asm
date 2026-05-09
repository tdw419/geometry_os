; DESCRIPTION: Places a red line segment connecting (259, 71) to (510, 105).
; PLAN: r0=259(x1), r1=71(y1), r2=510(x2), r3=105(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 71
LDI r2, 510
LDI r3, 105
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
