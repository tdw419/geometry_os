; DESCRIPTION: Places a purple line segment connecting (108, 94) to (391, 24).
; PLAN: r0=108(x1), r1=94(y1), r2=391(x2), r3=24(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 94
LDI r2, 391
LDI r3, 24
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
