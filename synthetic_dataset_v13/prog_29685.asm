; DESCRIPTION: Places a purple line segment connecting (75, 71) to (55, 23).
; PLAN: r0=75(x1), r1=71(y1), r2=55(x2), r3=23(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 71
LDI r2, 55
LDI r3, 23
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
