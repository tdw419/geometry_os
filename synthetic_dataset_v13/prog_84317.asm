; DESCRIPTION: Places a purple line segment connecting (353, 242) to (86, 156).
; PLAN: r0=353(x1), r1=242(y1), r2=86(x2), r3=156(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 242
LDI r2, 86
LDI r3, 156
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
