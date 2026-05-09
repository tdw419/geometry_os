; DESCRIPTION: Renders a blue line between points (231, 136) and (129, 22).
; PLAN: r0=231(x1), r1=136(y1), r2=129(x2), r3=22(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 136
LDI r2, 129
LDI r3, 22
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
