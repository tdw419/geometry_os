; DESCRIPTION: Renders a purple line between points (468, 97) and (153, 28).
; PLAN: r0=468(x1), r1=97(y1), r2=153(x2), r3=28(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 468
LDI r1, 97
LDI r2, 153
LDI r3, 28
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
