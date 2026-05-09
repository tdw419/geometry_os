; DESCRIPTION: Places a purple line segment connecting (31, 106) to (242, 58).
; PLAN: r0=31(x1), r1=106(y1), r2=242(x2), r3=58(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 106
LDI r2, 242
LDI r3, 58
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
