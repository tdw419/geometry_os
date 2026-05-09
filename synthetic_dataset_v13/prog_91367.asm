; DESCRIPTION: Places a purple line segment connecting (137, 76) to (242, 105).
; PLAN: r0=137(x1), r1=76(y1), r2=242(x2), r3=105(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 76
LDI r2, 242
LDI r3, 105
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
