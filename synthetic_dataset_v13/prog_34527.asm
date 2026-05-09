; DESCRIPTION: Places a magenta line segment connecting (201, 118) to (112, 23).
; PLAN: r0=201(x1), r1=118(y1), r2=112(x2), r3=23(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 118
LDI r2, 112
LDI r3, 23
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
