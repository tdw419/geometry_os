; DESCRIPTION: Places a purple line segment connecting (325, 148) to (391, 98).
; PLAN: r0=325(x1), r1=148(y1), r2=391(x2), r3=98(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 148
LDI r2, 391
LDI r3, 98
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
