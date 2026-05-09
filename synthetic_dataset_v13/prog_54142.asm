; DESCRIPTION: Places a purple line segment connecting (388, 242) to (368, 159).
; PLAN: r0=388(x1), r1=242(y1), r2=368(x2), r3=159(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 242
LDI r2, 368
LDI r3, 159
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
