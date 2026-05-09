; DESCRIPTION: Places a purple line segment connecting (308, 163) to (287, 223).
; PLAN: r0=308(x1), r1=163(y1), r2=287(x2), r3=223(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 163
LDI r2, 287
LDI r3, 223
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
