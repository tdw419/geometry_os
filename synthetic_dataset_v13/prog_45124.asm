; DESCRIPTION: Places a yellow line segment connecting (251, 179) to (162, 90).
; PLAN: r0=251(x1), r1=179(y1), r2=162(x2), r3=90(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 179
LDI r2, 162
LDI r3, 90
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
