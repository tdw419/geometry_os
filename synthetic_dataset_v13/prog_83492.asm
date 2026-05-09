; DESCRIPTION: Places a purple line segment connecting (285, 137) to (104, 28).
; PLAN: r0=285(x1), r1=137(y1), r2=104(x2), r3=28(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 137
LDI r2, 104
LDI r3, 28
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
