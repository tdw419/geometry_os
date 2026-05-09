; DESCRIPTION: Places a magenta line segment connecting (24, 201) to (422, 119).
; PLAN: r0=24(x1), r1=201(y1), r2=422(x2), r3=119(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 201
LDI r2, 422
LDI r3, 119
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
