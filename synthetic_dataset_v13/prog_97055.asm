; DESCRIPTION: Renders a purple line between points (178, 20) and (388, 35).
; PLAN: r0=178(x1), r1=20(y1), r2=388(x2), r3=35(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 20
LDI r2, 388
LDI r3, 35
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
