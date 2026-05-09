; DESCRIPTION: Renders a purple line between points (484, 26) and (496, 18).
; PLAN: r0=484(x1), r1=26(y1), r2=496(x2), r3=18(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 484
LDI r1, 26
LDI r2, 496
LDI r3, 18
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
