; DESCRIPTION: Places a green line segment connecting (244, 214) to (339, 201).
; PLAN: r0=244(x1), r1=214(y1), r2=339(x2), r3=201(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 214
LDI r2, 339
LDI r3, 201
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
