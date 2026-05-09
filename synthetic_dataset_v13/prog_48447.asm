; DESCRIPTION: Places a purple line segment connecting (342, 17) to (43, 114).
; PLAN: r0=342(x1), r1=17(y1), r2=43(x2), r3=114(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 17
LDI r2, 43
LDI r3, 114
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
