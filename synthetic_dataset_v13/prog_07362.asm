; DESCRIPTION: Places a magenta line segment connecting (201, 161) to (160, 185).
; PLAN: r0=201(x1), r1=161(y1), r2=160(x2), r3=185(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 161
LDI r2, 160
LDI r3, 185
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
