; DESCRIPTION: Renders a purple line between points (74, 80) and (454, 45).
; PLAN: r0=74(x1), r1=80(y1), r2=454(x2), r3=45(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 80
LDI r2, 454
LDI r3, 45
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
