; DESCRIPTION: Renders a blue line between points (272, 200) and (419, 22).
; PLAN: r0=272(x1), r1=200(y1), r2=419(x2), r3=22(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 200
LDI r2, 419
LDI r3, 22
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
