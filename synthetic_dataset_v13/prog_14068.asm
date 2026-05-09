; DESCRIPTION: Places a purple line segment connecting (342, 208) to (474, 170).
; PLAN: r0=342(x1), r1=208(y1), r2=474(x2), r3=170(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 208
LDI r2, 474
LDI r3, 170
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
