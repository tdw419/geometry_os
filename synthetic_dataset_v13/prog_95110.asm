; DESCRIPTION: Places a red line segment connecting (459, 18) to (163, 109).
; PLAN: r0=459(x1), r1=18(y1), r2=163(x2), r3=109(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 459
LDI r1, 18
LDI r2, 163
LDI r3, 109
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
