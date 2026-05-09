; DESCRIPTION: Places a red line segment connecting (264, 3) to (412, 201).
; PLAN: r0=264(x1), r1=3(y1), r2=412(x2), r3=201(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 3
LDI r2, 412
LDI r3, 201
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
