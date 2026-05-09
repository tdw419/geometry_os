; DESCRIPTION: Renders a blue line between points (89, 162) and (80, 122).
; PLAN: r0=89(x1), r1=162(y1), r2=80(x2), r3=122(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 162
LDI r2, 80
LDI r3, 122
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
