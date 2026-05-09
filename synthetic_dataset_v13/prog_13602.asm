; DESCRIPTION: Places a purple line segment connecting (193, 140) to (90, 229).
; PLAN: r0=193(x1), r1=140(y1), r2=90(x2), r3=229(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 140
LDI r2, 90
LDI r3, 229
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
