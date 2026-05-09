; DESCRIPTION: Renders a purple line between points (89, 17) and (393, 5).
; PLAN: r0=89(x1), r1=17(y1), r2=393(x2), r3=5(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 17
LDI r2, 393
LDI r3, 5
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
