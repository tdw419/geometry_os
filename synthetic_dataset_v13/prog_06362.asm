; DESCRIPTION: Places a yellow line segment connecting (251, 34) to (189, 89).
; PLAN: r0=251(x1), r1=34(y1), r2=189(x2), r3=89(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 34
LDI r2, 189
LDI r3, 89
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
