; DESCRIPTION: Places a purple line segment connecting (357, 16) to (417, 240).
; PLAN: r0=357(x1), r1=16(y1), r2=417(x2), r3=240(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 16
LDI r2, 417
LDI r3, 240
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
