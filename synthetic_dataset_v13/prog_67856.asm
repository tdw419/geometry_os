; DESCRIPTION: Draws a black line from (390, 3) to (201, 216).
; PLAN: r0=390(x1), r1=3(y1), r2=201(x2), r3=216(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 3
LDI r2, 201
LDI r3, 216
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
