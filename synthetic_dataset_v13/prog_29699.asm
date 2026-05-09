; DESCRIPTION: Places a purple line segment connecting (418, 40) to (330, 81).
; PLAN: r0=418(x1), r1=40(y1), r2=330(x2), r3=81(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 40
LDI r2, 330
LDI r3, 81
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
