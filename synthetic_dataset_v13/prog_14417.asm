; DESCRIPTION: Places a green line segment connecting (94, 23) to (201, 237).
; PLAN: r0=94(x1), r1=23(y1), r2=201(x2), r3=237(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 23
LDI r2, 201
LDI r3, 237
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
