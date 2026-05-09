; DESCRIPTION: Places a purple line segment connecting (388, 117) to (399, 161).
; PLAN: r0=388(x1), r1=117(y1), r2=399(x2), r3=161(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 117
LDI r2, 399
LDI r3, 161
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
