; DESCRIPTION: Draws a yellow line from (201, 51) to (500, 202).
; PLAN: r0=201(x1), r1=51(y1), r2=500(x2), r3=202(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 51
LDI r2, 500
LDI r3, 202
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
