; DESCRIPTION: Places a purple line segment connecting (75, 100) to (313, 189).
; PLAN: r0=75(x1), r1=100(y1), r2=313(x2), r3=189(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 100
LDI r2, 313
LDI r3, 189
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
