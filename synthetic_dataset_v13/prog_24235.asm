; DESCRIPTION: Renders a purple line between points (192, 211) and (448, 23).
; PLAN: r0=192(x1), r1=211(y1), r2=448(x2), r3=23(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 211
LDI r2, 448
LDI r3, 23
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
