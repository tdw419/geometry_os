; DESCRIPTION: Renders a purple line between points (3, 162) and (190, 172).
; PLAN: r0=3(x1), r1=162(y1), r2=190(x2), r3=172(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 162
LDI r2, 190
LDI r3, 172
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
