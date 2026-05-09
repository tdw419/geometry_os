; DESCRIPTION: Renders a blue line between points (260, 110) and (472, 129).
; PLAN: r0=260(x1), r1=110(y1), r2=472(x2), r3=129(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 110
LDI r2, 472
LDI r3, 129
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
