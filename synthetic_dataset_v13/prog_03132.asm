; DESCRIPTION: Renders a purple line between points (206, 119) and (269, 39).
; PLAN: r0=206(x1), r1=119(y1), r2=269(x2), r3=39(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 119
LDI r2, 269
LDI r3, 39
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
