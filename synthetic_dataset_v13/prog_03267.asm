; DESCRIPTION: Places a yellow line segment connecting (317, 14) to (402, 212).
; PLAN: r0=317(x1), r1=14(y1), r2=402(x2), r3=212(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 14
LDI r2, 402
LDI r3, 212
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
