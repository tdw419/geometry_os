; DESCRIPTION: Places a red line segment connecting (407, 172) to (418, 200).
; PLAN: r0=407(x1), r1=172(y1), r2=418(x2), r3=200(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 172
LDI r2, 418
LDI r3, 200
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
