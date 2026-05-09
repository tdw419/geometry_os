; DESCRIPTION: Renders a blue line between points (342, 99) and (62, 80).
; PLAN: r0=342(x1), r1=99(y1), r2=62(x2), r3=80(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 99
LDI r2, 62
LDI r3, 80
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
