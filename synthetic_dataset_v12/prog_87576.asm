; DESCRIPTION: Places a purple line segment connecting (154, 148) to (466, 201).
; PLAN: r0=154(x1), r1=148(y1), r2=466(x2), r3=201(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 148
LDI r2, 466
LDI r3, 201
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
