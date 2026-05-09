; DESCRIPTION: Places a purple line segment connecting (374, 36) to (343, 29).
; PLAN: r0=374(x1), r1=36(y1), r2=343(x2), r3=29(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 36
LDI r2, 343
LDI r3, 29
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
