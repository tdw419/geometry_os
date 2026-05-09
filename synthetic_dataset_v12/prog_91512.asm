; DESCRIPTION: Places a red line segment connecting (495, 134) to (129, 185).
; PLAN: r0=495(x1), r1=134(y1), r2=129(x2), r3=185(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 495
LDI r1, 134
LDI r2, 129
LDI r3, 185
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
