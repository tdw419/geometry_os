; DESCRIPTION: Places a yellow line segment connecting (218, 49) to (317, 191).
; PLAN: r0=218(x1), r1=49(y1), r2=317(x2), r3=191(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 49
LDI r2, 317
LDI r3, 191
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
