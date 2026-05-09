; DESCRIPTION: Draws a black line from (201, 77) to (258, 62).
; PLAN: r0=201(x1), r1=77(y1), r2=258(x2), r3=62(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 77
LDI r2, 258
LDI r3, 62
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
