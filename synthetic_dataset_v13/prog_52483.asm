; DESCRIPTION: Places a purple line segment connecting (288, 124) to (75, 23).
; PLAN: r0=288(x1), r1=124(y1), r2=75(x2), r3=23(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 124
LDI r2, 75
LDI r3, 23
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
