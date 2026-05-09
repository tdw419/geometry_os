; DESCRIPTION: Renders a black line between points (390, 94) and (97, 227).
; PLAN: r0=390(x1), r1=94(y1), r2=97(x2), r3=227(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 94
LDI r2, 97
LDI r3, 227
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
