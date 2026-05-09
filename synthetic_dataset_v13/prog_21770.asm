; DESCRIPTION: Places a yellow line segment connecting (34, 237) to (17, 131).
; PLAN: r0=34(x1), r1=237(y1), r2=17(x2), r3=131(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 237
LDI r2, 17
LDI r3, 131
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
