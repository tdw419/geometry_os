; DESCRIPTION: Renders a purple line between points (468, 147) and (68, 9).
; PLAN: r0=468(x1), r1=147(y1), r2=68(x2), r3=9(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 468
LDI r1, 147
LDI r2, 68
LDI r3, 9
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
