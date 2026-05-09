; DESCRIPTION: Places a white line segment connecting (507, 20) to (391, 201).
; PLAN: r0=507(x1), r1=20(y1), r2=391(x2), r3=201(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 507
LDI r1, 20
LDI r2, 391
LDI r3, 201
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
