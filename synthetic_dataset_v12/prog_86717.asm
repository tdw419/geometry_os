; DESCRIPTION: Renders a purple line between points (269, 34) and (24, 8).
; PLAN: r0=269(x1), r1=34(y1), r2=24(x2), r3=8(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 34
LDI r2, 24
LDI r3, 8
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
