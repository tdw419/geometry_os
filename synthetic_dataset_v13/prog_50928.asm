; DESCRIPTION: Renders a blue line between points (229, 84) and (68, 201).
; PLAN: r0=229(x1), r1=84(y1), r2=68(x2), r3=201(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 84
LDI r2, 68
LDI r3, 201
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
