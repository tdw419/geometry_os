; DESCRIPTION: Draws a black line from (142, 80) to (296, 201).
; PLAN: r0=142(x1), r1=80(y1), r2=296(x2), r3=201(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 80
LDI r2, 296
LDI r3, 201
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
