; DESCRIPTION: Places a purple line segment connecting (58, 83) to (425, 58).
; PLAN: r0=58(x1), r1=83(y1), r2=425(x2), r3=58(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 83
LDI r2, 425
LDI r3, 58
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
