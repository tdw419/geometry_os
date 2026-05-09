; DESCRIPTION: Places a green line segment connecting (201, 9) to (200, 64).
; PLAN: r0=201(x1), r1=9(y1), r2=200(x2), r3=64(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 9
LDI r2, 200
LDI r3, 64
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
