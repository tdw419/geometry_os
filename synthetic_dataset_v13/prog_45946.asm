; DESCRIPTION: Places a purple line segment connecting (8, 189) to (243, 201).
; PLAN: r0=8(x1), r1=189(y1), r2=243(x2), r3=201(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 189
LDI r2, 243
LDI r3, 201
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
