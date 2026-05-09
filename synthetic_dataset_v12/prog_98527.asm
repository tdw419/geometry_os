; DESCRIPTION: Places a purple line segment connecting (342, 226) to (266, 58).
; PLAN: r0=342(x1), r1=226(y1), r2=266(x2), r3=58(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 226
LDI r2, 266
LDI r3, 58
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
