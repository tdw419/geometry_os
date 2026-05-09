; DESCRIPTION: Places a purple line segment connecting (227, 111) to (308, 33).
; PLAN: r0=227(x1), r1=111(y1), r2=308(x2), r3=33(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 111
LDI r2, 308
LDI r3, 33
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
