; DESCRIPTION: Renders a yellow line between points (201, 218) and (390, 210).
; PLAN: r0=201(x1), r1=218(y1), r2=390(x2), r3=210(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 218
LDI r2, 390
LDI r3, 210
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
