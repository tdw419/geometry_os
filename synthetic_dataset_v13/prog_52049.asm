; DESCRIPTION: Places a purple line segment connecting (111, 153) to (289, 89).
; PLAN: r0=111(x1), r1=153(y1), r2=289(x2), r3=89(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 153
LDI r2, 289
LDI r3, 89
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
