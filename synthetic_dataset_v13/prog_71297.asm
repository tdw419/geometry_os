; DESCRIPTION: Renders a blue line between points (500, 106) and (201, 94).
; PLAN: r0=500(x1), r1=106(y1), r2=201(x2), r3=94(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 500
LDI r1, 106
LDI r2, 201
LDI r3, 94
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
