; DESCRIPTION: Draws a white line from (10, 155) to (201, 15).
; PLAN: r0=10(x1), r1=155(y1), r2=201(x2), r3=15(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 155
LDI r2, 201
LDI r3, 15
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
