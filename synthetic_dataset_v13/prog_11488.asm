; DESCRIPTION: Places a purple line segment connecting (129, 93) to (441, 20).
; PLAN: r0=129(x1), r1=93(y1), r2=441(x2), r3=20(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 93
LDI r2, 441
LDI r3, 20
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
