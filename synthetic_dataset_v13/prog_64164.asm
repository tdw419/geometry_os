; DESCRIPTION: Renders a purple line between points (416, 20) and (137, 124).
; PLAN: r0=416(x1), r1=20(y1), r2=137(x2), r3=124(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 20
LDI r2, 137
LDI r3, 124
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
