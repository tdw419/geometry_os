; DESCRIPTION: Places a purple line segment connecting (312, 223) to (135, 18).
; PLAN: r0=312(x1), r1=223(y1), r2=135(x2), r3=18(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 223
LDI r2, 135
LDI r3, 18
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
