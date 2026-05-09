; DESCRIPTION: Renders a purple line between points (489, 18) and (269, 52).
; PLAN: r0=489(x1), r1=18(y1), r2=269(x2), r3=52(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 489
LDI r1, 18
LDI r2, 269
LDI r3, 52
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
