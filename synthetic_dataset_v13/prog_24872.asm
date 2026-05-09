; DESCRIPTION: Places a purple line segment connecting (449, 44) to (191, 52).
; PLAN: r0=449(x1), r1=44(y1), r2=191(x2), r3=52(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 44
LDI r2, 191
LDI r3, 52
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
