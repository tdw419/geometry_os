; DESCRIPTION: Places a magenta line segment connecting (201, 165) to (62, 177).
; PLAN: r0=201(x1), r1=165(y1), r2=62(x2), r3=177(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 165
LDI r2, 62
LDI r3, 177
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
