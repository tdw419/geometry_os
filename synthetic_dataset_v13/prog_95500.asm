; DESCRIPTION: Places a yellow line segment connecting (422, 129) to (51, 201).
; PLAN: r0=422(x1), r1=129(y1), r2=51(x2), r3=201(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 129
LDI r2, 51
LDI r3, 201
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
