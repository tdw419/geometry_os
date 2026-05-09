; DESCRIPTION: Places a purple line segment connecting (350, 29) to (498, 17).
; PLAN: r0=350(x1), r1=29(y1), r2=498(x2), r3=17(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 29
LDI r2, 498
LDI r3, 17
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
