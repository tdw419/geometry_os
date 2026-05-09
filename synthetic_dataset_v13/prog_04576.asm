; DESCRIPTION: Renders a purple line between points (25, 198) and (130, 105).
; PLAN: r0=25(x1), r1=198(y1), r2=130(x2), r3=105(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 198
LDI r2, 130
LDI r3, 105
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
