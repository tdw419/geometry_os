; DESCRIPTION: Places a purple line segment connecting (139, 50) to (40, 107).
; PLAN: r0=139(x1), r1=50(y1), r2=40(x2), r3=107(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 50
LDI r2, 40
LDI r3, 107
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
