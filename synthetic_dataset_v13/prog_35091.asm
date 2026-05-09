; DESCRIPTION: Places a yellow line segment connecting (10, 95) to (80, 149).
; PLAN: r0=10(x1), r1=95(y1), r2=80(x2), r3=149(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 95
LDI r2, 80
LDI r3, 149
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
