; DESCRIPTION: Places a purple line segment connecting (105, 10) to (73, 46).
; PLAN: r0=105(x1), r1=10(y1), r2=73(x2), r3=46(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 10
LDI r2, 73
LDI r3, 46
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
