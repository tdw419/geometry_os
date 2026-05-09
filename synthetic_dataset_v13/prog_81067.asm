; DESCRIPTION: Renders a blue line between points (471, 94) and (123, 84).
; PLAN: r0=471(x1), r1=94(y1), r2=123(x2), r3=84(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 471
LDI r1, 94
LDI r2, 123
LDI r3, 84
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
