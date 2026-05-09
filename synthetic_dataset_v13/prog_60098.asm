; DESCRIPTION: Places a black line segment connecting (72, 201) to (129, 190).
; PLAN: r0=72(x1), r1=201(y1), r2=129(x2), r3=190(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 201
LDI r2, 129
LDI r3, 190
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
