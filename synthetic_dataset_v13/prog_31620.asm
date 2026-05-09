; DESCRIPTION: Places a black line segment connecting (367, 19) to (10, 201).
; PLAN: r0=367(x1), r1=19(y1), r2=10(x2), r3=201(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 19
LDI r2, 10
LDI r3, 201
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
