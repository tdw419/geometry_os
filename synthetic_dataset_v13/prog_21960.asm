; DESCRIPTION: Renders a yellow line between points (448, 196) and (201, 233).
; PLAN: r0=448(x1), r1=196(y1), r2=201(x2), r3=233(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 448
LDI r1, 196
LDI r2, 201
LDI r3, 233
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
