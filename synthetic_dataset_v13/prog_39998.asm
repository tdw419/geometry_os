; DESCRIPTION: Renders a blue line between points (331, 34) and (2, 85).
; PLAN: r0=331(x1), r1=34(y1), r2=2(x2), r3=85(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 34
LDI r2, 2
LDI r3, 85
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
