; DESCRIPTION: Renders a purple line between points (468, 101) and (259, 172).
; PLAN: r0=468(x1), r1=101(y1), r2=259(x2), r3=172(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 468
LDI r1, 101
LDI r2, 259
LDI r3, 172
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
