; DESCRIPTION: Places a yellow line segment connecting (201, 162) to (198, 21).
; PLAN: r0=201(x1), r1=162(y1), r2=198(x2), r3=21(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 162
LDI r2, 198
LDI r3, 21
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
