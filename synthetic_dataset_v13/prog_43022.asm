; DESCRIPTION: Places a yellow line segment connecting (4, 174) to (89, 157).
; PLAN: r0=4(x1), r1=174(y1), r2=89(x2), r3=157(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 174
LDI r2, 89
LDI r3, 157
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
