; DESCRIPTION: Places a purple line segment connecting (24, 69) to (75, 2).
; PLAN: r0=24(x1), r1=69(y1), r2=75(x2), r3=2(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 69
LDI r2, 75
LDI r3, 2
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
