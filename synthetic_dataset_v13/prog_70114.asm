; DESCRIPTION: Places a magenta line segment connecting (475, 154) to (110, 201).
; PLAN: r0=475(x1), r1=154(y1), r2=110(x2), r3=201(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 475
LDI r1, 154
LDI r2, 110
LDI r3, 201
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
