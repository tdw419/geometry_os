; DESCRIPTION: Places a black line segment connecting (54, 23) to (308, 212).
; PLAN: r0=54(x1), r1=23(y1), r2=308(x2), r3=212(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 23
LDI r2, 308
LDI r3, 212
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
