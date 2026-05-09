; DESCRIPTION: Places a purple line segment connecting (324, 61) to (493, 251).
; PLAN: r0=324(x1), r1=61(y1), r2=493(x2), r3=251(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 61
LDI r2, 493
LDI r3, 251
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
