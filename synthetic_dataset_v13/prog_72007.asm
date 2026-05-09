; DESCRIPTION: Places a purple line segment connecting (508, 44) to (75, 81).
; PLAN: r0=508(x1), r1=44(y1), r2=75(x2), r3=81(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 508
LDI r1, 44
LDI r2, 75
LDI r3, 81
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
