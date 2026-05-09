; DESCRIPTION: Renders a purple line between points (390, 129) and (39, 189).
; PLAN: r0=390(x1), r1=129(y1), r2=39(x2), r3=189(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 129
LDI r2, 39
LDI r3, 189
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
