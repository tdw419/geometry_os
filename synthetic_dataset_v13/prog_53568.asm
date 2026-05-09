; DESCRIPTION: Places a purple line segment connecting (439, 151) to (201, 230).
; PLAN: r0=439(x1), r1=151(y1), r2=201(x2), r3=230(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 151
LDI r2, 201
LDI r3, 230
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
