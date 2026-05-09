; DESCRIPTION: Places a red line segment connecting (217, 200) to (198, 201).
; PLAN: r0=217(x1), r1=200(y1), r2=198(x2), r3=201(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 200
LDI r2, 198
LDI r3, 201
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
