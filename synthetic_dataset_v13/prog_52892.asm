; DESCRIPTION: Places a yellow line segment connecting (318, 91) to (201, 91).
; PLAN: r0=318(x1), r1=91(y1), r2=201(x2), r3=91(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 91
LDI r2, 201
LDI r3, 91
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
