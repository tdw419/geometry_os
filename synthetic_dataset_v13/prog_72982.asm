; DESCRIPTION: Places a purple line segment connecting (176, 123) to (417, 160).
; PLAN: r0=176(x1), r1=123(y1), r2=417(x2), r3=160(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 123
LDI r2, 417
LDI r3, 160
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
