; DESCRIPTION: Places a purple line segment connecting (247, 178) to (374, 124).
; PLAN: r0=247(x1), r1=178(y1), r2=374(x2), r3=124(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 178
LDI r2, 374
LDI r3, 124
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
