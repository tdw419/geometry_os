; DESCRIPTION: Places a yellow line segment connecting (277, 24) to (334, 218).
; PLAN: r0=277(x1), r1=24(y1), r2=334(x2), r3=218(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 24
LDI r2, 334
LDI r3, 218
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
