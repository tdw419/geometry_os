; DESCRIPTION: Renders a purple line between points (300, 227) and (315, 222).
; PLAN: r0=300(x1), r1=227(y1), r2=315(x2), r3=222(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 227
LDI r2, 315
LDI r3, 222
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
