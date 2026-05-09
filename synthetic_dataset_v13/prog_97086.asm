; DESCRIPTION: Places a purple line segment connecting (350, 48) to (0, 169).
; PLAN: r0=350(x1), r1=48(y1), r2=0(x2), r3=169(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 48
LDI r2, 0
LDI r3, 169
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
