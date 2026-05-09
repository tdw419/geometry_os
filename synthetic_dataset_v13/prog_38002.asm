; DESCRIPTION: Places a black line segment connecting (353, 170) to (422, 58).
; PLAN: r0=353(x1), r1=170(y1), r2=422(x2), r3=58(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 170
LDI r2, 422
LDI r3, 58
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
