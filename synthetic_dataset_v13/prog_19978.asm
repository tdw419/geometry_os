; DESCRIPTION: Places a purple line segment connecting (361, 92) to (308, 139).
; PLAN: r0=361(x1), r1=92(y1), r2=308(x2), r3=139(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 92
LDI r2, 308
LDI r3, 139
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
