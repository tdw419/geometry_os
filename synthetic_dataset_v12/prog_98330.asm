; DESCRIPTION: Places a purple line segment connecting (498, 2) to (22, 173).
; PLAN: r0=498(x1), r1=2(y1), r2=22(x2), r3=173(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 498
LDI r1, 2
LDI r2, 22
LDI r3, 173
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
