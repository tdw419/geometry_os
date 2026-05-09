; DESCRIPTION: Places a purple line segment connecting (10, 161) to (465, 39).
; PLAN: r0=10(x1), r1=161(y1), r2=465(x2), r3=39(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 161
LDI r2, 465
LDI r3, 39
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
