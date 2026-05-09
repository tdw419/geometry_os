; DESCRIPTION: Draws a green line from (245, 201) to (407, 233).
; PLAN: r0=245(x1), r1=201(y1), r2=407(x2), r3=233(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 201
LDI r2, 407
LDI r3, 233
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
