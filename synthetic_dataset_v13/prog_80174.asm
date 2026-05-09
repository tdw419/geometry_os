; DESCRIPTION: Renders a purple line between points (57, 200) and (28, 22).
; PLAN: r0=57(x1), r1=200(y1), r2=28(x2), r3=22(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 200
LDI r2, 28
LDI r3, 22
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
