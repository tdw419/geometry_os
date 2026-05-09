; DESCRIPTION: Renders a blue line between points (114, 229) and (89, 238).
; PLAN: r0=114(x1), r1=229(y1), r2=89(x2), r3=238(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 229
LDI r2, 89
LDI r3, 238
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
