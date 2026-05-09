; DESCRIPTION: Places a yellow line segment connecting (122, 170) to (391, 237).
; PLAN: r0=122(x1), r1=170(y1), r2=391(x2), r3=237(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 170
LDI r2, 391
LDI r3, 237
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
