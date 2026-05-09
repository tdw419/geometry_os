; DESCRIPTION: Renders a blue line between points (192, 155) and (56, 205).
; PLAN: r0=192(x1), r1=155(y1), r2=56(x2), r3=205(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 155
LDI r2, 56
LDI r3, 205
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
