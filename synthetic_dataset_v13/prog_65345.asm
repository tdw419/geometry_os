; DESCRIPTION: Renders a purple line between points (119, 40) and (439, 124).
; PLAN: r0=119(x1), r1=40(y1), r2=439(x2), r3=124(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 40
LDI r2, 439
LDI r3, 124
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
