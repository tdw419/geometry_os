; DESCRIPTION: Places a purple line segment connecting (134, 170) to (475, 159).
; PLAN: r0=134(x1), r1=170(y1), r2=475(x2), r3=159(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 170
LDI r2, 475
LDI r3, 159
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
