; DESCRIPTION: Places a yellow line segment connecting (35, 80) to (109, 80).
; PLAN: r0=35(x1), r1=80(y1), r2=109(x2), r3=80(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 80
LDI r2, 109
LDI r3, 80
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
