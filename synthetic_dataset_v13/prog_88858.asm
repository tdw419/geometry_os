; DESCRIPTION: Renders a yellow line between points (390, 109) and (40, 129).
; PLAN: r0=390(x1), r1=109(y1), r2=40(x2), r3=129(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 109
LDI r2, 40
LDI r3, 129
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
