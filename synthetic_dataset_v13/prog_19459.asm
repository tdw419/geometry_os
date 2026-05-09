; DESCRIPTION: Renders a purple line between points (222, 220) and (260, 129).
; PLAN: r0=222(x1), r1=220(y1), r2=260(x2), r3=129(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 220
LDI r2, 260
LDI r3, 129
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
