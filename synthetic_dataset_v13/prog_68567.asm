; DESCRIPTION: Renders a purple line between points (115, 169) and (324, 240).
; PLAN: r0=115(x1), r1=169(y1), r2=324(x2), r3=240(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 169
LDI r2, 324
LDI r3, 240
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
