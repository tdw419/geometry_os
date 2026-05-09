; DESCRIPTION: Places a purple line segment connecting (272, 102) to (419, 144).
; PLAN: r0=272(x1), r1=102(y1), r2=419(x2), r3=144(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 102
LDI r2, 419
LDI r3, 144
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
