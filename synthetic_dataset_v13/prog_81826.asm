; DESCRIPTION: Places a purple line segment connecting (462, 106) to (265, 200).
; PLAN: r0=462(x1), r1=106(y1), r2=265(x2), r3=200(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 462
LDI r1, 106
LDI r2, 265
LDI r3, 200
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
