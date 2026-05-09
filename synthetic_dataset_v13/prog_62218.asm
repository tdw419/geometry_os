; DESCRIPTION: Places a magenta line segment connecting (304, 146) to (201, 99).
; PLAN: r0=304(x1), r1=146(y1), r2=201(x2), r3=99(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 146
LDI r2, 201
LDI r3, 99
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
