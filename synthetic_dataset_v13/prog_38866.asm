; DESCRIPTION: Places a purple line segment connecting (374, 178) to (413, 193).
; PLAN: r0=374(x1), r1=178(y1), r2=413(x2), r3=193(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 178
LDI r2, 413
LDI r3, 193
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
