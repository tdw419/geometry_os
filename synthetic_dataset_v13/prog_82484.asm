; DESCRIPTION: Renders a purple line between points (454, 32) and (112, 54).
; PLAN: r0=454(x1), r1=32(y1), r2=112(x2), r3=54(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 454
LDI r1, 32
LDI r2, 112
LDI r3, 54
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
