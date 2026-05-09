; DESCRIPTION: Draws a yellow line from (365, 201) to (97, 80).
; PLAN: r0=365(x1), r1=201(y1), r2=97(x2), r3=80(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 201
LDI r2, 97
LDI r3, 80
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
