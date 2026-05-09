; DESCRIPTION: Places a green line segment connecting (357, 201) to (290, 10).
; PLAN: r0=357(x1), r1=201(y1), r2=290(x2), r3=10(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 201
LDI r2, 290
LDI r3, 10
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
