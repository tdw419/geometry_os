; DESCRIPTION: Places a purple line segment connecting (293, 31) to (424, 162).
; PLAN: r0=293(x1), r1=31(y1), r2=424(x2), r3=162(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 31
LDI r2, 424
LDI r3, 162
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
