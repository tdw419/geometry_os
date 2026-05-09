; DESCRIPTION: Places a purple line segment connecting (15, 35) to (342, 141).
; PLAN: r0=15(x1), r1=35(y1), r2=342(x2), r3=141(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 35
LDI r2, 342
LDI r3, 141
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
