; DESCRIPTION: Places a yellow line segment connecting (425, 201) to (201, 87).
; PLAN: r0=425(x1), r1=201(y1), r2=201(x2), r3=87(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 201
LDI r2, 201
LDI r3, 87
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
