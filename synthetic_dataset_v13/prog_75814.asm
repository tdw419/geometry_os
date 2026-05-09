; DESCRIPTION: Places a purple line segment connecting (214, 5) to (0, 149).
; PLAN: r0=214(x1), r1=5(y1), r2=0(x2), r3=149(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 5
LDI r2, 0
LDI r3, 149
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
