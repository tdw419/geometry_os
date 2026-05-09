; DESCRIPTION: Places a purple line segment connecting (308, 64) to (376, 52).
; PLAN: r0=308(x1), r1=64(y1), r2=376(x2), r3=52(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 64
LDI r2, 376
LDI r3, 52
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
