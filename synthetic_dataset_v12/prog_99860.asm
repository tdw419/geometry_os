; DESCRIPTION: Places a purple line segment connecting (462, 40) to (375, 207).
; PLAN: r0=462(x1), r1=40(y1), r2=375(x2), r3=207(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 462
LDI r1, 40
LDI r2, 375
LDI r3, 207
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
