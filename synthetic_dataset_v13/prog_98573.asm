; DESCRIPTION: Renders a purple line between points (468, 179) and (462, 35).
; PLAN: r0=468(x1), r1=179(y1), r2=462(x2), r3=35(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 468
LDI r1, 179
LDI r2, 462
LDI r3, 35
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
