; DESCRIPTION: Draws a green line from (471, 137) to (201, 250).
; PLAN: r0=471(x1), r1=137(y1), r2=201(x2), r3=250(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 471
LDI r1, 137
LDI r2, 201
LDI r3, 250
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
