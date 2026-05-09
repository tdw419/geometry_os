; DESCRIPTION: Places a red line segment connecting (325, 26) to (459, 78).
; PLAN: r0=325(x1), r1=26(y1), r2=459(x2), r3=78(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 26
LDI r2, 459
LDI r3, 78
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
