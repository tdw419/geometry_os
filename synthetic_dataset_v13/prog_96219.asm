; DESCRIPTION: Places a purple line segment connecting (456, 85) to (462, 12).
; PLAN: r0=456(x1), r1=85(y1), r2=462(x2), r3=12(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 456
LDI r1, 85
LDI r2, 462
LDI r3, 12
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
