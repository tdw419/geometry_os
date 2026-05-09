; DESCRIPTION: Renders a purple line between points (237, 170) and (325, 190).
; PLAN: r0=237(x1), r1=170(y1), r2=325(x2), r3=190(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 170
LDI r2, 325
LDI r3, 190
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
