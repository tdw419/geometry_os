; DESCRIPTION: Places a purple line segment connecting (121, 75) to (194, 247).
; PLAN: r0=121(x1), r1=75(y1), r2=194(x2), r3=247(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 75
LDI r2, 194
LDI r3, 247
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
