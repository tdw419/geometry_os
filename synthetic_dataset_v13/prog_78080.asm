; DESCRIPTION: Places a green line segment connecting (459, 44) to (314, 194).
; PLAN: r0=459(x1), r1=44(y1), r2=314(x2), r3=194(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 459
LDI r1, 44
LDI r2, 314
LDI r3, 194
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
