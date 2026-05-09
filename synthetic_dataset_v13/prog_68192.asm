; DESCRIPTION: Renders a blue line between points (254, 201) and (1, 157).
; PLAN: r0=254(x1), r1=201(y1), r2=1(x2), r3=157(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 201
LDI r2, 1
LDI r3, 157
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
