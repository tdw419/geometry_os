; DESCRIPTION: Places a black line segment connecting (441, 33) to (201, 208).
; PLAN: r0=441(x1), r1=33(y1), r2=201(x2), r3=208(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 441
LDI r1, 33
LDI r2, 201
LDI r3, 208
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
