; DESCRIPTION: Places a purple line segment connecting (429, 99) to (118, 165).
; PLAN: r0=429(x1), r1=99(y1), r2=118(x2), r3=165(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 99
LDI r2, 118
LDI r3, 165
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
