; DESCRIPTION: Places a purple line segment connecting (449, 204) to (50, 131).
; PLAN: r0=449(x1), r1=204(y1), r2=50(x2), r3=131(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 204
LDI r2, 50
LDI r3, 131
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
