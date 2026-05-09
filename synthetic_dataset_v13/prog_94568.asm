; DESCRIPTION: Places a purple line segment connecting (471, 60) to (45, 31).
; PLAN: r0=471(x1), r1=60(y1), r2=45(x2), r3=31(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 471
LDI r1, 60
LDI r2, 45
LDI r3, 31
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
