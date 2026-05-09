; DESCRIPTION: Draws a blue line from (201, 161) to (417, 124).
; PLAN: r0=201(x1), r1=161(y1), r2=417(x2), r3=124(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 161
LDI r2, 417
LDI r3, 124
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
