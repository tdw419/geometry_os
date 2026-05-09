; DESCRIPTION: Draws a yellow line from (245, 219) to (363, 201).
; PLAN: r0=245(x1), r1=219(y1), r2=363(x2), r3=201(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 219
LDI r2, 363
LDI r3, 201
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
