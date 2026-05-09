; DESCRIPTION: Places a purple line segment connecting (399, 54) to (169, 44).
; PLAN: r0=399(x1), r1=54(y1), r2=169(x2), r3=44(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 54
LDI r2, 169
LDI r3, 44
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
