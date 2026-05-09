; DESCRIPTION: Places a purple line segment connecting (72, 2) to (260, 104).
; PLAN: r0=72(x1), r1=2(y1), r2=260(x2), r3=104(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 2
LDI r2, 260
LDI r3, 104
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
