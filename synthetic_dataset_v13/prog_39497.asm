; DESCRIPTION: Places a purple line segment connecting (151, 251) to (336, 162).
; PLAN: r0=151(x1), r1=251(y1), r2=336(x2), r3=162(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 251
LDI r2, 336
LDI r3, 162
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
