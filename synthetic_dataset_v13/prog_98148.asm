; DESCRIPTION: Places a red line segment connecting (287, 201) to (400, 56).
; PLAN: r0=287(x1), r1=201(y1), r2=400(x2), r3=56(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 201
LDI r2, 400
LDI r3, 56
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
