; DESCRIPTION: Places a purple line segment connecting (200, 117) to (496, 55).
; PLAN: r0=200(x1), r1=117(y1), r2=496(x2), r3=55(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 117
LDI r2, 496
LDI r3, 55
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
