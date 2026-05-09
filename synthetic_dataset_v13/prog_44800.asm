; DESCRIPTION: Renders a blue line between points (362, 162) and (201, 251).
; PLAN: r0=362(x1), r1=162(y1), r2=201(x2), r3=251(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 162
LDI r2, 201
LDI r3, 251
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
