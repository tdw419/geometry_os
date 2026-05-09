; DESCRIPTION: Places a green line segment connecting (391, 133) to (449, 34).
; PLAN: r0=391(x1), r1=133(y1), r2=449(x2), r3=34(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 133
LDI r2, 449
LDI r3, 34
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
