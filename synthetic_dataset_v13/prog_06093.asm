; DESCRIPTION: Renders a purple line between points (28, 44) and (81, 130).
; PLAN: r0=28(x1), r1=44(y1), r2=81(x2), r3=130(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 44
LDI r2, 81
LDI r3, 130
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
