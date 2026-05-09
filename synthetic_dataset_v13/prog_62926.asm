; DESCRIPTION: Places a purple line segment connecting (338, 40) to (114, 12).
; PLAN: r0=338(x1), r1=40(y1), r2=114(x2), r3=12(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 40
LDI r2, 114
LDI r3, 12
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
