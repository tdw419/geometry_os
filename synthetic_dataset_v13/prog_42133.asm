; DESCRIPTION: Places a purple line segment connecting (159, 87) to (374, 161).
; PLAN: r0=159(x1), r1=87(y1), r2=374(x2), r3=161(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 87
LDI r2, 374
LDI r3, 161
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
