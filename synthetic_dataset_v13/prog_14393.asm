; DESCRIPTION: Places a yellow line segment connecting (317, 56) to (96, 245).
; PLAN: r0=317(x1), r1=56(y1), r2=96(x2), r3=245(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 56
LDI r2, 96
LDI r3, 245
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
