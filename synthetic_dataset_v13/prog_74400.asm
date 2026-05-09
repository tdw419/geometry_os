; DESCRIPTION: Places a purple line segment connecting (443, 124) to (315, 100).
; PLAN: r0=443(x1), r1=124(y1), r2=315(x2), r3=100(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 443
LDI r1, 124
LDI r2, 315
LDI r3, 100
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
