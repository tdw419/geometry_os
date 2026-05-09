; DESCRIPTION: Renders a purple line between points (211, 123) and (5, 22).
; PLAN: r0=211(x1), r1=123(y1), r2=5(x2), r3=22(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 123
LDI r2, 5
LDI r3, 22
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
