; DESCRIPTION: Places a purple line segment connecting (106, 242) to (288, 40).
; PLAN: r0=106(x1), r1=242(y1), r2=288(x2), r3=40(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 242
LDI r2, 288
LDI r3, 40
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
