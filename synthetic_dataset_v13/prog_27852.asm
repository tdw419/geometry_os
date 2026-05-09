; DESCRIPTION: Renders a blue line between points (93, 150) and (366, 123).
; PLAN: r0=93(x1), r1=150(y1), r2=366(x2), r3=123(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 150
LDI r2, 366
LDI r3, 123
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
