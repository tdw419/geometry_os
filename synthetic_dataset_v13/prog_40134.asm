; DESCRIPTION: Renders a purple line between points (188, 13) and (36, 20).
; PLAN: r0=188(x1), r1=13(y1), r2=36(x2), r3=20(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 13
LDI r2, 36
LDI r3, 20
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
